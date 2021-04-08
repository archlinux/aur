# Maintainer: Colin Arnott <colin@urandom.co.uk>
# Co-Maintainer: Luca Weiss <WEI16416@spengergasse.at>

pkgname=azure-vhd-utils-git
pkgver=r38.44cbada
pkgrel=1
pkgdesc="Azure VHD utilities for Go."
arch=('any')
url="https://github.com/Microsoft/azure-vhd-utils"
license=('MIT')
makedepends=('go' 'git')
source=("git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-git} 
  go build \
    -o=vhd \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    .
}

package() {
  cd ${pkgname%-git} 
  install -Dm755 vhd -t "$pkgdir/usr/bin/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
