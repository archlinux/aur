# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=libtas
pkgver=1.3.1
pkgrel=2
pkgdesc="Tool-assisted speedrunning utility for Linux-native binaries"
arch=('x86_64')
url="https://github.com/clementgallet/libTAS"
license=('GPL3')
depends=('alsa-lib' 'ffmpeg' 'fontconfig' 'freetype2'
         'libtar' 'qt5-base' 'zlib')
makedepends=('cmake' 'extra-cmake-modules')
source=("${url}/archive/v${pkgver}.tar.gz"
        linTAS.desktop)
sha512sums=('7aa4698af30231dca50b37bbd258d7b6c0cec8d3aa264a5b01fb69756d6799b3b1f8bcde02affb76568704269270ec393fc52bd151d592af85b21589463efbef'
            '7002415aaa670e7cbee27ef8031bb0f61a6f3182212b435270e47a3567ff45fe0d98db92a7798fa1d3573a07627d224a8ba645c5503b7f03663f9eef545aab40')

build() {
  cd "libTAS-$pkgver"

  mkdir build && cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "libTAS-$pkgver/build"

  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/linTAS.desktop" "$pkgdir/usr/share/applications/linTAS.desktop"
}
