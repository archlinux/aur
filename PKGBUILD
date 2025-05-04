# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: lubosz

_pkgname=tagpy
pkgname=python-${_pkgname}
pkgver=2025.1
pkgrel=1
pkgdesc='Python bindings for TagLib'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'arm' 'aarch64')
url='https://github.com/palfrey/tagpy'
license=('MIT')
depends=(python
         python-packaging
         taglib
         boost-libs
         gcc-libs
         glibc)
makedepends=(python-build
             python-installer
             python-setuptools
             python-wheel
             boost)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/palfrey/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4343389b8792928ce54acdcb88c50dcdd06dff8cd5821068438e98ccecaee295')

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package(){
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
