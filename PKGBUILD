# Maintainer: quietvoid <tcChlisop0@gmail.com>

pkgname=subrandr
pkgver=1.4.0
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
b2sums=('eeec506f486b48851dbd8df278b5d5826b75745627059130401cb24ffd22b7c1f36c2d541c83777167a2ddefd629600c085733a32dae50e211912a24b402ac76')

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
