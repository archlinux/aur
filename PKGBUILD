# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=vsxu
pkgver=0.5.1
pkgrel=3
pkgdesc="A free to use program that lets you create and perform real-time audio visual presets."
arch=('i686' 'x86_64')
url="http://www.vsxu.com/"
license=('GPL' 'custom')
depends=('desktop-file-utils' 'glew' 'glfw2' 'libpng' 'opencv' 'xdg-utils')
makedepends=('alsa-lib' 'cmake' 'jack' 'pulseaudio')
optdepends=(
  'alsa-lib: ALSA support.'
  'jack: JACK support'
  'pulseaudio: PulseAudio support'
)
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("https://github.com/vovoid/vsxu/archive/v${pkgver}.tar.gz")
sha512sums=('e77d8e7300a43ceeb59cf39771f0d8ac8930cebffb4d25305a9e245fd5e2d668e126267227c5334f999688307f8b22cf30183c495137f7490942d78581d0d4a6')

prepare() {
  cd "${pkgname}-${pkgver}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${pkgname}-${pkgver}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
        -DGLFW_LIBRARY=/usr/lib/libglfw2.so
  make
}

package() {
  cd "${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install

  # License.
  install -Dm644 "../COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
