# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>
# Based on the rbdoom3-bfg-git package by M0Rf30

pkgname=rbdoom-3-bfg
pkgver=1.0.3
pkgrel=3
pkgdesc="Doom 3 BFG source code (Robert Beckebans repo)."
arch=('i686' 'x86_64')
url="https://github.com/RobertBeckebans/RBDOOM-3-BFG"
license=('GPL3')
groups=('games')
depends=(alsa-lib doom3bfg-data ffmpeg glew libgl libjpeg-turbo
         libxxf86vm libstdc++5 openal sdl2 zlib)
makedepends=('cmake' 'zip')
conflicts=('rbdoom3-bfg-git')
optdepends=('alsa-plugins: pulseaudio-support'
            'libpulse: pulseaudio support')
source=("https://github.com/RobertBeckebans/RBDOOM-3-BFG/archive/${pkgver}.tar.gz"
        'rbdoom-3-bfg.desktop')
sha256sums=('961182e741529c0a3634f1892d067b724ddd800cca936522c1d70415789e6bfb'
            'b05a261bd2fd4c1a32788d68397c98e17008d0636bc948edad51d2ebe29f5a8a')

build() {
  mkdir "$srcdir/RBDOOM-3-BFG-$pkgver/build"
  cd "$srcdir/RBDOOM-3-BFG-$pkgver/build"

  cmake -G "Unix Makefiles" -DCMAKE_BUILD_TYPE=RelWithDebInfo \
	-DCMAKE_INSTALL_PREFIX=/usr -DOPENAL=1 -DSDL2=ON\
	-DUSE_SYSTEM_LIBGLEW=1 -DUSE_SYSTEM_LIBJPEG=1 \
	-DUSE_SYSTEM_ZLIB=1 ../neo
  make
}

package() {
  cd "$srcdir/RBDOOM-3-BFG-$pkgver/build"

  install -Dm755 RBDoom3BFG "$pkgdir/usr/bin/RBDoom3BFG"
  install -Dm644 "$srcdir/rbdoom-3-bfg.desktop" "$pkgdir/usr/share/applications/rbdoom-3-bfg.desktop"
}
