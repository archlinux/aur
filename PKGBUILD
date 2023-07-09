# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=tagpy
pkgname=python-${_pkgname}
pkgver=2022.1
pkgrel=2
pkgdesc='Python bindings for TagLib'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'arm' 'aarch64')
url='http://pypi.python.org/pypi/tagpy'
license=('MIT')
depends=('python' 'taglib' 'boost-libs')
makedepends=('python-setuptools' 'boost')
source=("https://pypi.python.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8939bf0ccd7c4e776feccb1d5e7b72f31e11a0c8c5f9e37154bad6a9fa444bff')

_prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -uNp2 -r- -i ../compile_fix.patch
}

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package(){
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
