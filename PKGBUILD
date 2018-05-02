# Maintainer: Ainola
pkgname=plasma5-applets-plasma-pass-git
pkgver=r16.d067ec5
pkgrel=1
pkgdesc='Plasma applet for pass.'
url="https://cgit.kde.org/scratch/dvratil/plasma-pass.git"
arch=('x86_64' 'i686')
license=('custom')  # No license in the repo yet as of writing.
depends=('pass' 'plasma-framework')
makedepends=('cmake' 'git')
conflicts=('renameutils' 'imv')
source=("git+https://anongit.kde.org/scratch/dvratil/plasma-pass.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/plasma-pass"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/plasma-pass"
    [ -d build ] && rm -Rf build
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
}
package(){
    cd "${srcdir}/plasma-pass/build"
    make DESTDIR="$pkgdir" install
}

md5sums=('SKIP')
