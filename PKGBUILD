# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname=qrcp-bin
pkgver=0.11.7
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

sha256sums_x86_64=('84220cc93e6e33ba63658b46619c9946c65a86d62ba063d4eac5be34753e786e')
sha256sums_i686=('a2bfec42b4bac5befc7760ab77357d86a6ce9b54e47148270357cf8bc049451e')
sha256sums_armv7h=('ea8049525df777561885b048be8f87cd1613413dd1535885ff84ae69c01b62d2')
sha256sums_aarch64=('ee318873074e4a2935f5cf9b3e289f65083cc8894af19d51805b07a73b9c790f')

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
