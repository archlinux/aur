# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Ainola
# Contributor: jfranco

pkgname=plasma5-applets-plasma-pass-git
pkgver=1.0.0.r18.d5999a0
pkgrel=1
pkgdesc='Plasma applet for the Pass password manager'
url="https://cgit.kde.org/plasma-pass.git"
arch=('x86_64')
license=('GPL2')
depends=('pass' 'plasma-framework' 'kitemmodels')
makedepends=('extra-cmake-modules' 'git')
provides=('plasma5-applets-plasma-pass' 'plasma-pass')
conflicts=('plasma5-applets-plasma-pass' 'plasma-pass')
source=("git+https://anongit.kde.org/plasma-pass.git")
sha256sums=('SKIP')

pkgver() {
    cd plasma-pass
    printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    mkdir -p plasma-pass/build
    cd plasma-pass/build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
}

package(){
    cd plasma-pass/build
    make DESTDIR="$pkgdir" install
}
