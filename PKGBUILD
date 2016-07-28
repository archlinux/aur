# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=yotta
pkgver=0.16.4
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
sha512sums=('04b2815b083363449af42b52e52ade14b9eba78870c09429fef439643ec68798312fa1ac0b3563795ee38b2bb0ef29f57927a2ddcfc4caf922cf12346a48ed25')

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

