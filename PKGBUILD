# Maintainer: Feakster <feakster at posteo dot eu>

### Notes ###
# - Repo: 'https://github.com/physimals/pyfab'
# - Docs: 'https://pyfab.readthedocs.io/en/latest/'
# - Fabber is provided by FSL, but can be installed as a standalone (https://github.com/physimals/fabber_core)
# - Currently triggers test failures

### Info ###
pkgname=python-pyfab
_pkgname=${pkgname/python-/}
pkgver=0.3.5
pkgrel=1
pkgdesc='Python interface to the Fabber Bayesian model fitting tool'
arch=('any')
url='https://pyfab.readthedocs.io'
license=('custom:PYFAB license')
depends=('fsl>=6.0.1' 'python' 'python-numpy' 'python-nibabel' 'python-six')
optdepends=('fslpy: MVN functionality')
makedepends=('git' 'python-setuptools')
# checkdepends=('python-pytest')
source=("$pkgname::git+https://github.com/physimals/${_pkgname}.git#tag=v$pkgver")
b2sums=('SKIP')

### Build ###
build() {
    ## Change Directory ##
    cd "$srcdir/$pkgname"

    ## Build ##
    python setup.py build
}

# ### Check ###
# check() {
#     ## Change Directory ##
#     cd "$srcdir/$pkgname"
#
#     ## Test ##
#     pytest
# }

### Package ###
package() {
    ## Change Directory ##
    cd "$srcdir/$pkgname"

    ## Install Package ##
    python setup.py install \
    --prefix=/usr \
    --root="$pkgdir"/ \
    --optimize=1 \
    --skip-build

    ## Install License ##
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

    ## Install Docs ##
    install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
