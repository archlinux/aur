# Maintainer: Mathias Buhr <napcode@aparatus.de>

pkgname=octasine
pkgver=0.8.7
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
sha256sums=('b862c9f334c3c98dd563451ccbc2bdb987dd7e0fe7c445a96c8ab10e0f67d329')

build() {
  cd OctaSine-${pkgver}
  cargo xtask bundle octasine --release --verbose --no-default-features --features "glow vst2"
}

package() {
  mkdir -p ${pkgdir}/usr/lib/vst
  cp ${srcdir}/OctaSine-${pkgver}/target/bundled/octasine.so ${pkgdir}/usr/lib/vst/OctaSine.so
  chmod +x ${pkgdir}/usr/lib/vst/OctaSine.so
}
