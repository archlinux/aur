# Maintainer: Mathias Buhr <napcode@aparatus.de>

pkgname=octasine
pkgver=0.5.4
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
sha256sums=('575d99e6fb317b4e7d8c3bdaa6e17804b9938fe392be6033ed538e24e034eed9')

build() {
  cd OctaSine-${pkgver}
  cargo build --release -p octasine_vst2_plugin
}

package() {
  mkdir -p $pkgdir/usr/lib/vst
  cp ${srcdir}/OctaSine-${pkgver}/target/release/liboctasine.so ${pkgdir}/usr/lib/vst/OctaSine.so
  chmod +x ${pkgdir}/usr/lib/vst/OctaSine.so
}
