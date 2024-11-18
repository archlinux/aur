# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=stereocrossdelay
_plugin_uri="https://chrisarndt.de/plugins/$pkgname"
pkgver=0.2.0
pkgrel=1
pkgdesc='A stereo delay, multi-format audio effect plugin with feedback and cross-mixing'
arch=(x86_64 aarch64)
url="https://github.com/SpotlightKid/$pkgname"
license=(MIT)
depends=(gcc-libs glibc)
checkdepends=(kxstudio-lv2-extensions lv2lint)
optdepends=(
  'clap-host: for loading the CLAP plugin'
  'ladspa-host: for loading the LADSPA plugin'
  'lv2-host: for loading the LV2 plugin'
  'vst-host: for loading the VST2 plugin'
  'vst3-host: for loading the VST3 plugin'
)
groups=(clap-plugins ladspa-plugins lv2-plugins pro-audio vst-plugins vst3-plugins)
source=("https://github.com/SpotlightKid/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-source.tar.gz")
sha256sums=('61b49a0aa77d2d29deeb763ab90d8dd82cd96a5897466a66960a4b59ef396bb8')

build() {
  cd $pkgname-$pkgver
  make
}

check() {
  cd $pkgname-$pkgver
  make lv2lint
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" PREFIX=/usr install
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
}
