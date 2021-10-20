# Maintainer: Rafal Malachowicz <k5hv@linux.pl>
pkgname=nlite
pkgver=20210807193427
pkgrel=1
pkgdesc='NLite Client for NextPVR'.
url='https://www.nextpvr.com/'
arch=('x86_64' 'i686')
depends=('sdl2' 'sdl2_ttf' 'sdl2_image' 'vlc')
makedepends=('cmake' 'sdl2' 'sdl2_ttf' 'sdl2_image' 'vlc')
source=("https://www.nextpvr.com/nlite-src.zip"
        "CMakeLists.patch"
        "nlite.desktop")
sha512sums=('e575dcd19a77dfef566e2aaf877d69384ecebaf5e650ffca3d69d987390765024b61db06bce62387956219294abc9a9639056746b94103ba422dfb92782333fa'
            '48069620030bc4acc4f1a1224ec9b4fae48d860810b0f99b6877edfc1d3288c4c75a74f2fd6dc848b736442639b3ef7cc637e3bf7e3f0e54bf835ed9fa7facb6'
            '6c57e3c94efd33a8f53b581c1787949e1aecf98f302be72788e4e0c7dab3072caedaa3b02dd30f6f45b148d733ac8bb23017c3e6fccfe89b8c1e89ca7736e79d')

prepare() {
  patch -p1 -i ${srcdir}/CMakeLists.patch
}

build() {
  mkdir "${srcdir}/build"
  cd "${srcdir}/build"
  cmake ..
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -m755 "${srcdir}/build/nlite" "$pkgdir/usr/bin/nlite"
  install -D -m644 "nlite.desktop" "${pkgdir}/usr/share/applications/nlite.desktop"
}
