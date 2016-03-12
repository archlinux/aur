# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=yotta
pkgver=0.14.1
pkgrel=1
pkgdesc="Tool for managing reusable components for C/C++ by mbed"
url="http://yottadocs.mbed.com/"
depends=('python'
         'python-pip'
         'python-semantic-version'
         'python-requests'
         'python-github'
         'python-colorama'
         'python-hgapi'
         'python-jinja'
         'python-cryptography'
         'python-jwt'
         'python-jsonschema'
         'python-argcomplete'
         'mbed-test-wrapper'
         'valinor'
         'python-intelhex'
         'python-jsonpointer'
         'python-ndg-httpsclient'
)
optdepends=()
license=('Apache')
arch=('any')
source=("https://github.com/ARMmbed/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('1a5de18a0bc593101aca13f059a416560e80b9496bb1725858050baa68e5fe2245138da0e63240175b833eeb1392349203f64fccfe2bd78dbfe4a9d5aff4614b')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Argcomplete v1.1 is out
    sed -i -e 's/argcomplete>=0.8.0,<=1.0/argcomplete>=0.8.0,<=1.1/' setup.py

    # Pathlib is in Python3
    sed -i -e '/.*pathlib.*/d' setup.py

    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}

