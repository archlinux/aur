# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=yotta
pkgver=0.18.1
pkgrel=1
pkgdesc="Tool for managing reusable components for C/C++ by mbed"
url="http://yottadocs.mbed.com/"
depends=('python'
         'python-pip'
         'python-semantic-version'
         'python-requests'
         'python-pygithub'
         'python-colorama'
         'python-hgapi'
         'python-jinja'
         'python-cryptography'
         'python-pyjwt'
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
sha512sums=('0680d6a41b315bc5fb2dfdfb13c33b3eaf6bba37d0d651434f0990c015d78da1f73374b6761f8b5508465cc4ff0ec75859375bc4bf057979b21d4edf68a99a62')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    # Pathlib is in Python3
    sed -i -e '/.*pathlib.*/d' setup.py

    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}

