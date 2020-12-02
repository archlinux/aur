# Maintainer: slimb

_pkgname=razer_test
pkgname=z3ntu-razer_test-git
pkgver=r152.7d866a6
pkgrel=1
pkgdesc="A work-in-progress replacement for OpenRazer"
arch=('x86_64')
url="https://github.com/z3ntu/razer_test"
license=('GPL3')
depends=('qt5-base' 'hidapi' 'systemd-libs')
makedepends=('git' 'meson' 'qt5-tools')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/z3ntu/razer_test.git')
sha512sums=('SKIP')

pkgver() {
   cd "$_pkgname"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
   arch-meson "$_pkgname" build
   ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
