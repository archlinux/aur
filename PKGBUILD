# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=vsxu
pkgver=0.6.1
pkgrel=1
pkgdesc="A free to use program that lets you create and perform real-time audio visual presets."
arch=('i686' 'x86_64')
url="http://www.vsxu.com/"
license=('GPL' 'custom')
depends=('desktop-file-utils' 'glew' 'libpng' 'opencv' 'xdg-utils')
makedepends=('alsa-lib' 'cmake' 'git' 'jack' 'pulseaudio')
optdepends=(
  'alsa-lib: ALSA support.'
  'jack: JACK support'
  'pulseaudio: PulseAudio support'
)
source=("git+https://github.com/vovoid/vsxu#tag=v${pkgver}")
sha512sums=('SKIP')

prepare() {
  cd "${pkgname}"
  [[ -d build ]] || mkdir build
  git submodule update --init
}

build() {
  cd "${pkgname}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr 
  make
}

package() {
  cd "${pkgname}/build"
  make DESTDIR="${pkgdir}" install

  # License.
  install -Dm644 "../COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
