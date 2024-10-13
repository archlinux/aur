# Maintainer: username227 <gfrank227 [at] gmail [dot] com>
# Contributor: FadeMind <fademind@gmail.com> 
# Contributor: Presence <hidden mail data>

pkgname=kdocker-git
_pkgname=kdocker
pkgver=6.1.r2.fe7bd0e
pkgrel=1
pkgdesc="An application to help you dock any application into the system tray (git version)"
arch=('i686' 'x86_64')
url="https://github.com/user-none/KDocker"
license=('GPL2')
depends=('qt6-base' 'libxpm' 'libxmu')
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
makedepends=('git' 'ninja' 'clang' 'make' 'gcc' 'cmake' 'pod2man')
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
    cd "$srcdir/$_pkgname"
    cmake -B build -G Ninja \
    	-DCMAKE_INSTALL_PREFIX=/usr \
    	-DCMAKE_BUILD_TYPE=None \
    	-Wno-dev
    ninja -C build
}

package() {
    DESTDIR="$pkgdir/" ninja -C $srcdir/kdocker/build install
}
