# Maintainer: Dmitry Kharitonov <darksab0r@gmail.com>
# Contributor: Francois Garillot <francois[@]garillot.net>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Malkov Fyodor aka krox <iksut@yandex.ru>
# Contributor: carstene1ns <arch carsten-teibes de>

pkgbase=python-djvulibre
pkgname=(python-djvulibre python2-djvulibre)
pkgver=0.8
pkgrel=3
pkgdesc="A set of Python bindings for the DjVuLibre library"
arch=('i686' 'x86_64')
url="http://jwilk.net/software/python-djvulibre"
license=('GPL2')
depends=('djvulibre')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://pypi.io/packages/source/p/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9d6bf3143fa540e8ce330949c9edff7847ad7cd715f7c02e2991212873a5f31b')

prepare(){
	cp -rup ${pkgbase}-${pkgver} python2-djvulibre-${pkgver}

	cd "${srcdir}/python2-djvulibre-${pkgver}"
	sed -i "s/'python'/'python2'/" setup.py
}

build() {
  # build for python 3
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build

  # build for python 2
  cd "../python2-djvulibre-${pkgver}"
  python2 setup.py build
}

# package for python 3
package_python-djvulibre() {
  depends=('python' 'cython')
  pkgdesc+=" 3"
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
}

# package for python 2
package_python2-djvulibre() {
  depends=('python2' 'cython2')
  pkgdesc+=" 2"
  cd "${srcdir}/python2-djvulibre-${pkgver}"
  python setup.py install --root="${pkgdir}"
}
