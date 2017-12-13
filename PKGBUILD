# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

_pkgname=xs
pkgname=${_pkgname}-git
pkgver=r999.ba6704e
pkgrel=1
pkgdesc="An extensible shell descended from es and rc. (GIT version)"
arch=('x86_64' 'i686')
url="https://github.com/TieDyedDevil/XS"
license=('Custom')
depends=('boost' 'libffi' 'gc')
makedepends=('git' 'meson' 'ninja')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/TieDyedDevil/${_pkgname}.git")
sha256sums=('SKIP')
install=xs.install

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}
  meson --prefix /usr --buildtype release build
  ninja -C build
}

package() {
  cd ${_pkgname}
  install -D -m644 "doc/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  DESTDIR=${pkgdir} ninja -C build install
}

# vim:set ts=2 sw=2 et:
