# Maintainer:  Peter Mattern <pmattern at arcor dot de>

_pkgname=otter-browser
pkgname=$_pkgname-qtwebengine-git
pkgver=0.9.07.2.g2b632ed
pkgrel=2
pkgdesc="Project aiming to recreate aspects of Opera 12.x UI using Qt5.
         Built against QtWebEngine (experimental)."
arch=("i686" "x86_64")
url="http://www.otter-browser.org"
license=("GPL3")
makedepends=("git" "cmake")
depends=("qt5-webengine" "qt5-webkit" "qt5-multimedia" "qt5-script")
provides=("$_pkgname" "$_pkgname-git")
conflicts=("$_pkgname" "$_pkgname-git")
install=$pkgname.install
source=("git+https://github.com/OtterBrowser/otter-browser.git")
sha256sums=("SKIP")

pkgver() {
    cd $_pkgname
    git describe --tags | sed 's/^v//;s/-/./g'
}

build() {
    mkdir -p build && cd build
    cmake $srcdir/$_pkgname -DEnableQtwebengine=ON -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
}
