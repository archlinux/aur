# Maintainer: Quentin Faidide < quentin dot faidide at gmail dot com >

pkgname=kholors-station-git
_pkgname=KholorsStation
pkgrel=1
pkgver=1.17.0.r52.g278957b # This is a placeholder, pkgver() will generate the real one
pkgdesc="A standalone application fed by VST3 plugin for live, color-coded frequency spectrum analysis of a DAW mix."
arch=('x86_64')
url="https://github.com/QuentinFaidide/KholorsStation"
license=('GPL-3.0-or-later')
depends=('hicolor-icon-theme' 'libglvnd' 'curl' 'libcurl-gnutls' 'gcc-libs' 'glibc' 'libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'freetype2' 'nlohmann-json' 'alsa-lib' 'gtk3')
makedepends=('git' 'cmake')
provides=("kholors-station")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  cmake -B build -S . \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir/$_pkgname"
  DESTDIR="$pkgdir" cmake --install build
}
