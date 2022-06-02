# Maintainer: Mathias Buhr <napcode@aparatus.de>

pkgname=octasine
pkgver=0.6.1
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
sha256sums=('7a79f582d3a68f8343779859152425515c4b5b2c2dae622e26812ae2d4a8f5b1')

build() {
  cd OctaSine-${pkgver}
  cargo build --release -p octasine_vst2_plugin
}

package() {
  mkdir -p $pkgdir/usr/lib/vst
  cp ${srcdir}/OctaSine-${pkgver}/target/release/liboctasine.so ${pkgdir}/usr/lib/vst/OctaSine.so
  chmod +x ${pkgdir}/usr/lib/vst/OctaSine.so
}
