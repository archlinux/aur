# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=subrandr
pkgver=1.3.0
pkgrel=1
pkgdesc='A subtitle rendering library'
_rootdir="${pkgname}-${pkgver}"
arch=('x86_64')
url='https://github.com/afishhh/subrandr'
license=('MPL-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
conflicts=('subrandr')
provides=('subrandr' 'libsubrandr.so')
source=("${_rootdir}.tar.gz::https://github.com/afishhh/subrandr/archive/v${pkgver}.tar.gz")
b2sums=('c70aff932edbcf300c805b4cf68bacddc1e7ece25823c7c6413da4da2a8ab82c1d23cae2558507ef4f9844b759bd35b798eeeb382b780495e3c5765b52fdd5b2')

build() {
  cd "${_rootdir}"

  cargo xtask build
}

package() {
  cd "${_rootdir}"

  # destdir currently expects the prefix to be included
  cargo xtask install \
    --destdir "${pkgdir}/usr" \
    --prefix "${pkgdir}/usr"


  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
