# Maintainer: Niclas Meyer <niclas at countingsort dot com>

pkgname=kiwmi-git
pkgver=r208.e0142de
pkgrel=1
pkgdesc="A fully manual tiling Wayland compositor"
arch=('i686' 'x86_64')
url="https://github.com/buffet/kiwmi"
license=('MPL')
depends=('luajit' 'wlroots')
makedepends=('git' 'meson' 'ninja')
conflicts=('kiwmi')
provides=('kiwmi')
source=("${pkgname}::git+https://github.com/buffet/kiwmi.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  meson --prefix /usr --buildtype release -Dlua-pkg=luajit build
  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
}
