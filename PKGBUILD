pkgname=tensorflow-vala
pkgver=0.12.1+5+g43ab3ab
pkgrel=1
pkgdesc="Vala bindings for TensorFlow"
url="https://github.com/arrufat/tensorflow-vala"
license=('Apache2')
arch=('any')
depends=('tensorflow')
makedepends=('meson')
source=(git+https://github.com/arrufat/tensorflow-vala.git)
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/tensorflow-vala
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd ${srcdir}/tensorflow-vala
  [[ -d build ]] && rm -rf build
  mkdir build && cd build
  meson --prefix /usr
  ninja
  ninja docs/devhelp
}

check() {
  cd ${srcdir}/tensorflow-vala/build
  ninja test
}

package() {
  cd ${srcdir}/tensorflow-vala/build
  DESTDIR=${pkgdir} ninja install
}


# vim:set ts=2 sw=2 et:
