# Maintainer: Jean-Gabriel Young <info@jgyoung.ca>

pkgname=python-pystan
pkgver=2.19.0.0
pkgrel=2
pkgdesc="Python interface to Stan, a package for Bayesian inference."
arch=('i686' 'x86_64')
url='http://mc-stan.org/'
license=(GPLv3)
depends=(python-numpy cython boost eigen sundials)
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz" "use-usr-libs.patch")
sha256sums=('b85301b960d5991918b40bd64a4e9321813657a9fc028e0f39edce7220a309eb'
            '4446891828e63f3541f3386cd5b44f35d575646dcc328016d23524756e35252a')
prepare() {
    patch --strip=0 --input=use-usr-libs.patch
}
build() {
    cd ${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${_name}-${pkgver}
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
