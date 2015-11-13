# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=yotta
pkgver=0.9.3
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
sha512sums=('e92ce4ea7533eeaec187843378ef2cdee32bc1057fc24b8e104c1bf668bcec80629087dc319646b5039f40eccc02eb53bfacd36c131c74a49fc44e89bd29942f')

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

