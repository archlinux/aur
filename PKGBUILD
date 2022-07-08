# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=ykchorus
_plugin_uri="https://chrisarndt.de/plugins/$pkgname"
pkgver=0.2.3
pkgrel=2
pkgdesc='A stereo dual-chorus audio effect LV2, LADSPA and VST2 plugin and JACK application'
arch=(x86_64 aarch64)
url="https://github.com/SpotlightKid/$pkgname"
license=(GPL2)
depends=(gcc-libs libglvnd)
checkdepends=(kxstudio-lv2-extensions lv2lint)
optdepends=(
  'jack: for stand-alone JACK client program'
  'ladspa-host: for LADSPA plugin'
  'lv2-host: for LV2 plugin'
  'vst-host: for VST plugin'
)
groups=(ladspa-plugins lv2-plugins pro-audio vst-plugins)
source=("https://github.com/SpotlightKid/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f1783e5fe73efb695fe9eeb298c0494030deb4ed29a048374f6b6ea412826716')

prepare() {
  cd $pkgname-$pkgver
  # We don't want the DSSI version:
  sed -i -e '/ykchorus-dssi/d' Makefile
  sed -i -e '/dssi_dsp$/d' plugins/YKChorus/Makefile
}

build() {
  cd $pkgname-$pkgver
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
