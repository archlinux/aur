# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Thiago Almeida <echo "dGhpYWdvYWxtZWlkYXNhQGdtYWlsLmNvbQo=" | base64 -d>

pkgname=qrcp-bin
pkgver=0.12.0
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

sha256sums_x86_64=('91f32d52a25b87e1819a00969773714e013ce2750c90ffb198db71584b238c6f')
sha256sums_i686=('ba903cd4c98ef7d074d88a45b20bc0e4fd9766ac500064713519feac4d9b2bb6')
sha256sums_armv7h=('2850c4e50cbcf41ec4bcb89842da5bc4855a9f52eb113ec1f59c43df4a3363c6')
sha256sums_aarch64=('dff16a1b31648f5fb8a9191cbda2558a3230729b53d1cb4d958be28375f7dbde')

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
