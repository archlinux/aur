# Maintainer: JustKidding <jk at vin dot ovh>

_pkgname=ueberzug
pkgname=python-${_pkgname}-nosimd-git
pkgver=18.1.3.r12.g5f3790e
pkgrel=1
pkgdesc="ueberzug is an python script which aims to replace w3mimgdisplay"
arch=('any')
url="https://github.com/seebye/${_pkgname}"
license=('GPL3')
depends=("libxext" "python-pillow" "python" "python-xlib" "python-docopt" "python-psutil" "python-attrs"
         "git")
makedepends=("python" "git" "python-setuptools")
source=("git+${url}.git#branch=master"
        "no-simd.patch")
md5sums=('SKIP'
         "SKIP")
conflicts=("python-${_pkgname}")
provides=("python-${_pkgname}")

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"
    patch --forward --strip=1 --input="${srcdir}/no-simd.patch"
}

build() {
    cd "$srcdir/$_pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname"
    python setup.py install --prefix=/usr --root "${pkgdir}" || return 1
}
