# Maintainer: Feakster <feakster at posteo dot eu>

### Notes ###
# - Repo: 'https://github.com/physimals/oxasl_ve'
# - Docs: 'https://oxasl.readthedocs.io'

### Info ###
pkgname=python-oxasl-ve
pkgver=0.1.1
pkgrel=2
pkgdesc='Python interface to the C++ based VEASLC tool for Vessel-encoded ASL designed for use with the OXASL processing pipeline'
arch=('any')
url='https://oxasl.readthedocs.io'
license=('APACHE')
depends=('fslpy>=1.13' 'python' 'python-numpy' 'python-oxasl')
makedepends=('git' 'python-setuptools')
# checkdepends=('python-pytest')
source=("$pkgname::git+https://github.com/physimals/oxasl_ve.git#tag=v$pkgver")
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
#     ## Run pytest ##
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
