# Maintainer: Mathias Buhr <napcode@aparatus.de>

pkgname=octasine
pkgver=0.8.1
pkgrel=1
pkgdesc='VST2 frequency modulation synthesizer written in Rust'
arch=('x86_64')
url='https://github.com/greatest-ape/OctaSine'
license=('GPL3')
groups=('pro-audio' 'vst-plugins')
depends=(
  'fontconfig'
  'freetype2'
  'xcb-util-wm'
  'libxcb'
  'expat'
  'libpng'
  'harfbuzz'
  'graphite'
  'glib2'
  'pcre'
  )
makedepends=(
  'rust'
)

source=(https://github.com/greatest-ape/OctaSine/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('e7cbfa06d950e02867570084b0c50c76beeff1db2a203d0a033721b9296fcba1')

build() {
  cd OctaSine-${pkgver}
  cargo build --release -p octasine-vst2-plugin
}

package() {
  mkdir -p ${pkgdir}/usr/lib/vst
  cp ${srcdir}/OctaSine-${pkgver}/target/release/liboctasine.so ${pkgdir}/usr/lib/vst/OctaSine.so
  chmod +x ${pkgdir}/usr/lib/vst/OctaSine.so
}
