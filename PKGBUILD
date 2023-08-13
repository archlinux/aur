# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=qimgv
pkgver=1.0.3+alpha+94+ge2675f13
pkgrel=1
pkgdesc="Qt5 image viewer with experimental webm playback"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/easymodo/qimgv"
license=(GPL3)
depends=(qt5-base qt5-imageformats qt5-svg mpv exiv2 opencv
         glibc gcc-libs hicolor-icon-theme)
makedepends=(git cmake qt5-tools )
optdepends=('kimageformats: support for more image formats'
            'qt5-apng-plugin: animated png support'
            'qtraw: raw images support')
_commit=e2675f135d6be45036f84285a68e5a079ab4f449
source=("git+https://github.com/easymodo/qimgv.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd qimgv
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cmake -B build -S "qimgv" -Wno-dev \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
