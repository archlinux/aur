# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgbase=python2-jpype1
pkgname=('python-jpype1' 'python2-jpype1')
_pkgname=jpype1
pkgver=0.6.3
pkgrel=1
pkgdesc="Python to Java bridge, an effort to allow Python programs full access to Java class libraries"
arch=('x86_64')
url="https://github.com/jpype-project/jpype"
license=('APACHE')
depends=('java-runtime')
makedepends=('python-setuptools' 'python2-setuptools')
conflicts=('jpype')
source=("JPype1-${pkgver}.tar.gz"::"https://github.com/jpype-project/jpype/archive/v${pkgver}.tar.gz")
sha256sums=('5c447f4ac2d97f60ee1753fa59dd32ebdc29e16571db9ce2fb7a67362d459e22')

prepare() {
  # Create a copy of the original source to build for specific python versions
  cp -r "jpype-${pkgver}" "python-${_pkgname}-${pkgver}"
  cp -r "jpype-${pkgver}" "python2-${_pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/python-${_pkgname}-${pkgver}"
  echo "Building Python 3.x version"
  python setup.py build

  cd "${srcdir}/python2-${_pkgname}-${pkgver}"
  echo "Building Python 2.x version"
  python2 setup.py build
}

package_python-jpype1() {
  depends=('python')

  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-jpype1() {
  depends=('python2')

  cd "${pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

