# Maintainer: Michal Ulianko <michal (dot) ulianko (at) gmail (dot) com>

pkgname=python-pivy-git
pkgver=0.6.4.r3.gad7b50f
pkgrel=1
pkgdesc="Coin binding for Python"
arch=('x86_64')
url="https://github.com/FreeCAD/pivy"
license=('other')
depends=('python' 'coin-hg' 'python-pyside2')
makedepends=('git' 'cmake' 'swig')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('pivy::git+https://github.com/FreeCAD/pivy.git'
        'char_ptr_fix.patch')
noextract=()
md5sums=('SKIP'
         '0ba9c4ba4f822ed8f819209c333d5cbc')

pkgver() {
    cd "$srcdir/pivy"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/pivy"
    patch -p1 < "$srcdir/const_char_ptr_fix.patch"
}

package() {
    cd "$srcdir/pivy"
    python setup.py install --root="$pkgdir/" --optimize=1
}
