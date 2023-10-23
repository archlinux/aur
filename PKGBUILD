# Maintainer: Stuart Mumford <stuart at cadair dot com>

pkgname=nheko-krunner-git
pkgver=0.2.0.r3.g150f3a6
pkgrel=1
pkgdesc="A KRunner plugin to list joined rooms and possibly other things from nheko."
arch=("i686" "x86_64" "aarch64")

url="https://github.com/LorenDB/nheko-krunner/"
license=("GPL3")

depends=("qt5-base" "krunner5" "ki18n5")
makedepends=("git" "cmake" "gcc" "fontconfig" "qt5-tools")
provides=("nheko-krunner=${pkgver}")

source=("$pkgname::git+https://github.com/LorenDB/nheko-krunner.git#branch=master")
md5sums=("SKIP")

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    cmake -DKDE_INSTALL_PLUGINDIR=`kf5-config --qt-plugins` .
}

package() {
   cd "$pkgname"
   DESTDIR="$pkgdir" make install
}
