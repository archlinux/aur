# Maintainer: Emeric Grange <emeric.grange@gmail.com>
# Created: 27/02/2020

# The upstream software is not package friendly yet, so instead of rewriting its
# entire build system, we just built it as is and copy it into /opt/shadered.
# If you want to help improve or maintain this package please let me know!

pkgname=shadered
pkgver=1.3.0
pkgrel=1
pkgdesc="SHADERed is a lightweight tool for creating and testing HLSL and GLSL shaders."
arch=("x86_64")
url="https://github.com/dfranx/SHADERed"
license=("MIT")
depends=(assimp glew glm gtk3 sdl2 sfml)
makedepends=(cmake git)

source=("git+https://github.com/dfranx/SHADERed.git#commit=5272328"
        "SHADERed.desktop")
sha256sums=('SKIP'
            'bf424b2f2c64f52554f10b14b6bf4708826af3dcbe1284a9552f3487c7acc548')

build() {
  cd SHADERed/
  git submodule update --init --recursive
  cmake .
  make
}

package() {
  cd "$srcdir/SHADERed"
  #install -Dm644 "$srcdir/SHADERed/bin/icon.png" "$pkgdir/usr/share/pixmap/shadered.png"
  install -Dm644 "$srcdir/SHADERed.desktop" "$pkgdir/usr/share/applications/shadered.desktop"
  mkdir -p "$pkgdir/opt/$pkgname"
  mv $srcdir/SHADERed/bin/* "$pkgdir/opt/$pkgname"
}
