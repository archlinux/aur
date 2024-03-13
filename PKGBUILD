# Maintainer: Nico <d3sox at protonmail dot com>

_reponame=kwin-forceblur
pkgname=kwin-effects-forceblur
pkgver=1.1.1
pkgrel=2
pkgdesc="KWin Blur effect fork with window class force blur feature (Wayland & X11)"
arch=(x86_64)
url="https://github.com/taj-ny/$_reponame"
license=(GPL3)
depends=(kio knotifications kwin kcrash kglobalaccel)
makedepends=(git extra-cmake-modules qt6-tools)
source=("$pkgname::$url/archive/refs/tags/v$pkgver.tar.gz")
install="$pkgname.install"
sha256sums=('63502d3da698b3554c2870f587660d7850fd8b95d6f7aadc67b847ce3b185fe9')

build() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S "$_reponame-$pkgver"
    make -j"$(nproc)" -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" PREFIX=/usr install
}

