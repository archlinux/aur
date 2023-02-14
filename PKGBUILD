# Maintainer: Mathias Buhr <napcode@aparatus.de>

pkgname=octasine
pkgver=0.8.3
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
sha256sums=('8ddad2874165bd7d0b28f87c0d8cd7eb55021607deb79eed1f4e2890b13f003c')

build() {
  cd OctaSine-${pkgver}
  cargo xtask bundle octasine --release --verbose --no-default-features --features "glow vst2"
}

package() {
  mkdir -p ${pkgdir}/usr/lib/vst
  cp ${srcdir}/OctaSine-${pkgver}/target/bundled/octasine.so ${pkgdir}/usr/lib/vst/OctaSine.so
  chmod +x ${pkgdir}/usr/lib/vst/OctaSine.so
}
