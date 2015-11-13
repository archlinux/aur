# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=yotta
pkgver=0.10.1
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
sha512sums=('67c8dc7f4b148cb72fd868f54a70242bd340e5b6d7eafc9d29b84733171fd2c887111ba0cdd2f3d6f23c386cf1b603c48e93112c48b5769e59a2e7d90f78ed65')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Argcomplete v1.0 is out
    sed -i -e 's/argcomplete>=0.8.0,<1.0/argcomplete>=0.8.0,<=1.0/' setup.py

    # Pathlib is in Python3
    sed -i -e '/.*pathlib.*/d' setup.py

    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}

