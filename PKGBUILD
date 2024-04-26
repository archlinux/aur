# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=ykchorus
_plugin_uri="https://chrisarndt.de/plugins/$pkgname"
pkgver=0.2.4
pkgrel=3
pkgdesc='A stereo dual-chorus audio effect CLAP/LADSPA/LV2/VST2/VST3 plugin and JACK application'
arch=(x86_64 aarch64)
url="https://github.com/SpotlightKid/$pkgname"
license=(GPL-2.0-only)
depends=(gcc-libs glibc libglvnd libx11 libxcursor libxext libxrandr)
makedepends=(dbus)
checkdepends=(kxstudio-lv2-extensions lv2lint)
optdepends=(
  'jack: for stand-alone JACK client program'
  'clap-host: for CLAP plugin'
  'ladspa-host: for LADSPA plugin'
  'lv2-host: for LV2 plugin'
  'vst-host: for VST2 plugin'
  'vst3-host: for VST3 plugin'
)
groups=(clap-plugins ladspa-plugins lv2-plugins pro-audio vst-plugins vst3-plugins)
source=("https://github.com/SpotlightKid/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1dfd5981c52e5567eea15b43961f6bd3a88a96c0e8eabd9f56d823d24edb3970')

build() {
  cd $pkgname-$pkgver
  make SKIP_NATIVE_AUDIO_FALLBACK=true
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  depends+=(libdbus-1.so)
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
