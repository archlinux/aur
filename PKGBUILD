# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-mbed-tools
pkgver=0.1.14
_pkgname=mbed
_pkgver=108
pkgrel=1
pkgdesc="Tool for managing reusable components for C/C++ by mbed"
url="https://github.com/mbedmicro/mbed"
depends=('python'
         'python-pip'
         'python-colorama'
         'python-jinja'
         'python-intelhex'
         'python-prettytable'
         'python-pyserial'
)
optdepends=()
license=('Apache')
arch=('any')
source=("https://github.com/mbedmicro/${_pkgname}/archive/${_pkgname}_lib_rev${_pkgver}.tar.gz")
sha512sums=('0498919f25f5099d62f6ce19687c1f78d4b33a327ffc2050bb0a68807ecd5f6bacc30c8ea095610e459d00190e934e3b4beb04758532bcfcbf688be8e179c4e0')

build() {
    cd "$srcdir/$_pkgname-mbed_lib_rev$_pkgver"

    # Argcomplete v1.0 is out
    #sed -i -e 's/argcomplete>=0.8.0,<1.0/argcomplete>=0.8.0,<=1.0/' setup.py

    # Pathlib is in Python3
    #sed -i -e '/.*pathlib.*/d' setup.py

    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-mbed_lib_rev$_pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}

