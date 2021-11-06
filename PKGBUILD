# Maintainer: reggiiie <reggiiie@tutanota.com>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Alad Wenter <alad@mailbox.org>
# Contributor: Martin Wimpress <code@flexion.org>

pkgname=gpick-git
pkgver=0.2.6.r22.g0e858d3
pkgrel=1
pkgdesc="Advanced color picker written in C++ using GTK+ toolkit"
arch=(i686 x86_64 armv7h aarch64)
url="http://www.gpick.org/"
license=(BSD)
depends=(boost-libs gtk3 lua)
makedepends=(boost cmake ragel)
provides=(gpick)
conflicts=(gpick)
source=("git+https://github.com/thezbyg/gpick.git")
sha256sums=(SKIP)

pkgver() {
    cd gpick
    git describe --long --tags | sed 's/^gpick-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    mkdir build
    cd build
    cmake ../gpick -DCMAKE_INSTALL_PREFIX="/usr/"
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}/" install
    install -Dm644 "../gpick/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
