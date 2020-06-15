# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=yotta
pkgver=0.20.5
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
sha512sums=('3e816632f3e3f0a71942f7676dad2f2578bd0104b51f27981b1b0e72184854ad5e3e8267091139890cac02b94ae93fef2d94698df5475e3d5ebaa2f6f7feaae6')

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

