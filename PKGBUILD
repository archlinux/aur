# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname='qmapshack-git'
pkgver=1.16.1.r11.g2bf08eb5
pkgrel=2
pkgdesc='Plan your next outdoor trip'
arch=('x86_64')
url='https://github.com/Maproom/qmapshack/wiki'
license=('GPL3')
depends=('alglib' 'dav1d' 'gdal' 'proj' 'qt5-tools' 'qt5-webengine' 'quazip' 'routino>=3.1')
makedepends=('cmake' 'git')
conflicts=('qmapshack')
provides=('qmapshack')
replaces=('qmapshack-hg')
source=("$pkgname::git+https://github.com/Maproom/qmapshack.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"

    git describe --long --tags  | sed 's/^V_//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -S $pkgname -B build -DCMAKE_INSTALL_PREFIX='/usr'
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
