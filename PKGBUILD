# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname=qrcp-bin
pkgver=0.11.6
pkgrel=1
provides=('qrcp')
conflicts=('qrcp' 'qrcp-git')
pkgdesc="Transfer files over wifi from your computer to your mobile device by scanning a QR code without leaving the terminal."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/claudiodangelis/qrcp"
license=('MIT')
options=('!debug')

source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v${pkgver}/qrcp_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::$url/releases/download/v${pkgver}/qrcp_${pkgver}_linux_armv7.tar.gz")
source_i686=("$pkgname-$pkgver-i686.tar.gz::$url/releases/download/v${pkgver}/qrcp_${pkgver}_linux_386.tar.gz")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v${pkgver}/qrcp_${pkgver}_linux_amd64.tar.gz")

sha256sums_x86_64=('1bcd1e23460cb2c98eeb1a9df6e4f4f7cb1e889acdb53094a7c6805808790d13')
sha256sums_i686=('ce6c111cc3632e13e044046a56a5dc0874ddf51c2fd996607902d768c135b3f9')
sha256sums_armv7h=('46e760833165d211131ec04a6bbd754c9e558904dae32aedb99eb124518e8990')
sha256sums_aarch64=('970e34ac2ae17d39f4ceab0b35801becbd3727265463490f83638e4e2896e1fd')

latestver() {
    gh api repos/claudiodangelis/qrcp/releases/latest --jq '.tag_name' | sed 's/^v//'
}

build() {
  ./qrcp completion bash | install -Dm644 /dev/stdin share/bash-completion/completions/qrcp
  ./qrcp completion zsh | install -Dm644 /dev/stdin share/zsh/site-functions/_qrcp
  ./qrcp completion fish | install -Dm644 /dev/stdin share/fish/vendor_completions.d/qrcp.fish
}

package() {
 install -Dm755 qrcp "$pkgdir/usr/bin/qrcp"
 cp -r share/ "$pkgdir/usr"
 install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
 install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname/-bin/}"
}
