# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=yotta
pkgver=0.18.0
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
sha512sums=('5aa8654ece5e6cf0600ee1fb4dfce7eaa983797c47d552fd9d77f0dd54733e00f63613dab126d8398c5aec26a1e679032697f768d2f173481b412e4e2116a023')

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

