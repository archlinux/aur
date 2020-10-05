# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Ainola
# Contributor: jfranco

pkgname=plasma-pass-git
_pkgname=${pkgname%-git}
pkgver=1.1.0.r21.72fc453
pkgrel=1
pkgdesc="Plasma applet for the Pass password manager"
url="https://invent.kde.org/plasma/plasma-pass"
arch=(x86_64)
license=(GPL)
depends=(plasma-workspace kitemmodels)
makedepends=(extra-cmake-modules git)
provides=(plasma-pass)
conflicts=(plasma-pass)
source=("git+https://invent.kde.org/plasma/plasma-pass.git")
md5sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake ../"$_pkgname" \
        -DCMAKE_INSTALL_PREFIX=/usr
}

package(){
    cd build
    make DESTDIR="$pkgdir" install
}
