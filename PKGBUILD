# Maintainer: Ronan Jouchet <ronan@jouchet.fr>
# Based on clementine-git PKGBUILD

pkgname=procalc-git
pkgver=v1.0.6.r21.g4f204c6
pkgrel=1
pkgdesc='There is more to Pro Office Calculator than meets the eye. Look for subtle clues to unlock its secrets. You may be surprised how deep the rabbit hole goes.'
url='https://github.com/RobJinman/pro_office_calc'
license=('GPLv3')
arch=('i686' 'x86_64')
depends=('qt5-base' 'qt5-multimedia' 'tinyxml2')
makedepends=('gcc' 'cmake' 'qt5-base' 'qt5-multimedia' 'tinyxml2' 'chrpath' 'patchelf' 'git')
source=("git+https://github.com/RobJinman/pro_office_calc.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/pro_office_calc"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/pro_office_calc"
}

build() {
    mkdir -p "$srcdir/procalc-build"
    cd "$srcdir/procalc-build"
    cmake "$srcdir/pro_office_calc" \
        -G "Unix Makefiles" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX="/usr"
    make
}

package() {
    cd "$srcdir/procalc-build"
    make DESTDIR="$pkgdir" install
}
