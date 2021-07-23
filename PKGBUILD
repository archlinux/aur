# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Ex-Maintainer: William Turner <willtur.will@gmail.com>
pkgname='python-booleanoperations'
_pkgname=booleanOperations
pkgver=0.9.0
pkgrel=1
pkgdesc='Boolean operations on paths.'
arch=('any')
url='https://github.com/typemytype/booleanOperations'
license=('MIT')
#checkdepends=('python-pytest' 'python-defcon' 'python-fontpens')
checkdepends=()
depends=('python-pyclipper' 'python-fonttools')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.zip"
    'install.patch')
sha256sums=('8cfa821c32ad374fa120d6b2e0b444ebeac57c91e6631528645fa19ac2a281b8'
            'db49ee64cf2799da96c600570c3557ef2fee2998223d2ff5c0ad4ce62bfd4be6')

prepare() {
    cd "$_pkgname-$pkgver"
    patch -p1 -i ../install.patch
}

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
  install -D -m644  LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# tests disabled to break circular dependency
#check() {
  #cd "${_pkgname}-${pkgver}"
  #pytest
#}
