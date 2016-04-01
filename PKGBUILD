# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=yotta
pkgver=0.16.0
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
         'python-certifi'
)
optdepends=()
license=('Apache')
arch=('any')
source=("https://github.com/ARMmbed/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('8df24a1400b4884b3c85f5e3af8948901d87b1c63dcacf0b73e65a2f68e59ba3bc906b724868e7953fc700efc0ad127bce28c8d24ec04ac430e7520cd9452491')

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

