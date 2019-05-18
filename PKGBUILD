# Contributor: Ainola
# Contributor: jfranco
# Contributor: George Rawlinson

pkgname=plasma5-applets-plasma-pass-git
pkgver=r69.360dfe8
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
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
