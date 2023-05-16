# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=dfzitarev1
_plugin_uri="https://chrisarndt.de/plugins/$pkgname"
pkgver=0.2.0
pkgrel=1
pkgdesc='A feedback-delay-network reverb LV2 and VST3 plugin'
arch=(x86_64 aarch64)
url="https://github.com/SpotlightKid/$pkgname"
license=(MIT)
depends=(gcc-libs)
checkdepends=(kxstudio-lv2-extensions lv2lint)
optdepends=(
  'clap-host: for loading the CLAP plugin'
  'lv2-host: for loading the LV2 plugin'
  'vst3-host: for loading VST3 plugin'
)
groups=(lv2-plugins pro-audio vst2-plugins)
source=("https://github.com/SpotlightKid/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-source.tar.gz")
sha256sums=('649b96b2494a662231e69cbdaeb2ed7c4766312a5bb8d44c1bfbf30284a82aab')

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
