# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=dfzitarev1
_plugin_uri="https://chrisarndt.de/plugins/$pkgname"
pkgver=0.2.2
pkgrel=1
pkgdesc='A feedback-delay-network reverb CLAP, LV2 and VST3 plugin'
arch=(x86_64 aarch64)
url="https://github.com/SpotlightKid/$pkgname"
license=(MIT)
depends=(gcc-libs glibc)
checkdepends=(kxstudio-lv2-extensions lv2lint)
optdepends=(
  'clap-host: for loading the CLAP plugin'
  'lv2-host: for loading the LV2 plugin'
  'vst3-host: for loading VST3 plugin'
)
groups=(clap-plugins lv2-plugins pro-audio vst3-plugins)
source=("https://github.com/SpotlightKid/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-source.tar.gz")
sha256sums=('127c34c2af0102666c4af17fc6823fb2a3ae94d9bd6078d3ecd922824b0658dd')

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
