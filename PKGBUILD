# Maintainer: Caleb Jamison <cbjamo@gmail.com> 
pkgname=python-kinparse
pkgver=0.0.3
pkgrel=3
pkgdesc="Parser for KiCad schematic netlists."
arch=(any)
url="https://xesscorp.github.io/kinparse/docs/_build/singlehtml/index.html"
license=('MIT')
groups=()
depends=('python' 'python-future' 'python-pyparsing')
makedepends=('python-setuptools')
options=(!emptydirs)
_name=${pkgname#python-}
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz exclude-tests.patch)
md5sums=(9c0cf647aeb4e919f3d24db4c859f0a4 7d67f70e40ebd9945cce79be288c5f5c)

prepare() {
  cd "$srcdir/$_name-$pkgver"
  patch -Np1 -i "${srcdir}/exclude-tests.patch"
}       

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
}
