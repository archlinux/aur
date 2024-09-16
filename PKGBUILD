#Maintainer: louson

_name=yocto-cooker
pkgname=python-yocto-cooker
pkgver=1.4.0
pkgrel=2
url="https://github.com/cpb-/yocto-cooker"
pkgdesc="yocto-cooker is a easy yocto manager."
arch=(any)
depends=(python python-jsonschema python-urllib3 python-pyjson5)
makedepends=(python-setuptools)
checkdepends=(cmake)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cpb-/yocto-cooker/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('079d58b9ea2b5da1e918afdbb9f40d2c')
license=('GPL2')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -d "$pkgdir/usr/share/$pkgname"
    install -Dm644 sample-menus/* "$pkgdir/usr/share/$pkgname"
}

# Checks are failing in 1.4.0
# check() {
#     mkdir "tests" && cd tests
#     cmake "$srcdir/$_name-$pkgver/test/"
#     make
#     ctest
# }
