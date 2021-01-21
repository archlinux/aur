# Maintainer: Feakster <feakster at posteo dot eu>

### Notes ###
# - Repo: 'https://github.com/physimals/oxasl'
# - Docs: 'https://oxasl.readthedocs.io/en/latest/'

### Info ###
pkgname=python-oxasl
_pkgname=${pkgname/python-/}
pkgver=0.1.12
pkgrel=1
pkgdesc='OXASL is a package for performing Bayesian analysis of Arterial Spin Labelling MRI data'
arch=('any')
url='https://oxasl.readthedocs.io'
license=('custom:OXASL license')
depends=('fslpy>=1.13' 'python' 'python-numpy' 'python-pandas' 'python-pyaml' 'python-pyfab' 'python-nibabel' 'python-scikit-image' 'python-six')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname::git+https://github.com/physimals/${_pkgname}.git#tag=v$pkgver")
b2sums=('SKIP')

### Build ###
build() {
    ## Change Directory ##
    cd "$srcdir/$pkgname"

    ## Build ##
    python setup.py build
}

### Check ###
check() {
    ## Change Directory ##
    cd "$srcdir/$pkgname"

    ## Test ##
    pytest
}

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
