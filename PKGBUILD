# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: sn6uv mathics@angusgriffith.com
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: rnestler
# Contributor: mefistofeles

pkgname=mathics
pkgver=1.0
pkgrel=1
arch=('any')
pkgdesc='General-purpose online computer algebra system featuring Mathematica-compatible syntax and functions'
url='http://www.mathics.org/'
license=('GPL3')
depends=('python2-dateutil' 'python2-ply>=3.4' 'python2-six' 'python2-sympy>=0.7.3' 'python2-django>=1.6' 'python2-colorama' 'python2-argparse' 'python2-interruptingcow')
makedepends=('python2-setuptools')
optdepends=('cython2: cython optimisations')
source=("https://github.com/mathics/Mathics/releases/download/v${pkgver}/mathics-${pkgver}.tgz")
sha256sums=('865f146738e220d4f3dfaea11bcef9330957963644a33f67a58255bc29741282')

prepare() {
  cd "$pkgname-$pkgver"
  # mathics supports sympy==0.7.6 but works (with minor errors) for >=0.7.6
  sed -i 's/sympy==0.7.6/sympy>=0.7.3/' setup.py
  sed -i '66s/django >= 1.8, < 1.9/django/' setup.py
  find . -name "*.py" -exec sed -i '1s+python+python2+' {} \;
}

build() {
  cd "$pkgname-$pkgver"
  python2 setup.py build 
}

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --root=${pkgdir}
}
