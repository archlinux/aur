# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Sander Jansen <sander@knology.net>

pkgname=gogglesmm-develop-git
pkgver=1.2.1.r32.g20d8af7
pkgrel=1
pkgdesc="Music Manager and Player"
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url="https://gogglesmm.github.io"
license=(GPL3)
depends=(libepoxy libwebp libxcursor libxrandr libxft taglib glu opus libmad faad2 sqlite)
makedepends=(git cmake libpulse alsa-lib)
optdepends=('libpulse: PulseAudio Output'
            'alsa-lib: Alsa Output')
provides=(gogglesmm)
conflicts=(gogglesmm)
source=("git+https://github.com/gogglesmm/gogglesmm.git#branch=develop"
        "https://github.com/gogglesmm/gogglesmm/blob/4eb0eb66598f8501a37275802680f773f55724a0/po/ko.mo")
sha256sums=('SKIP'
            'b013fa1ac5a5443bb5f28ab270f987191bdb139f18a9a6c0344eda174992951c')

pkgver() {
  cd "${pkgname/-develop-git/}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  install -D ko.mo gogglesmm/po/
}

build() {
  cd "${pkgname/-develop-git/}"
  cmake . \
        -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname/-develop-git/}"
  make DESTDIR="$pkgdir" install
}
