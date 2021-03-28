# Maintainer: Alexey Galakhov <agalakhov@gmail.com>
pkgname=upliftpowerplay-git
_name=upp
pkgver=r40.557ab4e
pkgrel=2
epoch=
pkgdesc="UPP: A tool for parsing, dumping and modifying data in Radeon PowerPlay tables"
arch=('x86_64')
url="https://github.com/sibradzic/upp"
license=('GPL3')
groups=()
depends=('python-click' 'python')
conflicts=('upliftpowerplay')
provides=('upliftpowerplay')
changelog=
source=("upliftpowerplay-git::git://github.com/sibradzic/upp.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    #git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$pkgname"
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

