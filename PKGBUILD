# Maintainer: sn6uv mathics@angusgriffith.com
# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: rnestler
# Contributor: mefistofeles

pkgname=mathics
pkgver=0.8
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='General-purpose online computer algebra system featuring Mathematica-compatible syntax and functions'
url='http://www.mathics.org/'
license=('GPL3')
depends=('python2' 'python2-setuptools' 'python2-dateutil' 'python2-ply>=3.4' 'python2-six' 'python2-sympy>=0.7.3' 'python2-django>=1.6' 'python2-colorama' 'python2-argparse' 'python2-interruptingcow')
optdepends=(
    'cython2: cython optimisations'
)

source=("https://github.com/mathics/Mathics/releases/download/${pkgver}/mathics-${pkgver}.zip")
md5sums=('3d2d3f24d4ddc9cf1c4716e31c8417a1')


build() {
    # mathics supports sympy==0.7.6 but works (with minor errors) for >=0.7.6
    sed -i 's/sympy==0.7.6/sympy>=0.7.3/' setup.py
    sed -i 's/django >= 1.6, < 1.7/django>=1.6/' setup.py
    python2 setup.py build
}

package() {
    python2 setup.py install --root=${pkgdir}
}
