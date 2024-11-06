# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=dfjpverb
_plugin_uri="https://chrisarndt.de/plugins/$pkgname"
pkgver=0.1.2
pkgrel=1
pkgdesc='A lush algorithmic reverb CLAP, LV2 and VST3 plugin'
arch=(x86_64 aarch64)
url="https://github.com/SpotlightKid/$pkgname"
license=(GPL-2.0-or-later)
depends=(gcc-libs glibc)
checkdepends=(kxstudio-lv2-extensions lv2lint)
optdepends=(
  'clap-host: for loading the CLAP plugin'
  'lv2-host: for loading the LV2 plugin'
  'vst3-host: for loading VST3 plugin'
)
groups=(clap-plugins lv2-plugins pro-audio vst3-plugins)
source=("https://github.com/SpotlightKid/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-source.tar.gz")
sha256sums=('e6ba42d7683311bb4b25f6fba94e8cf0930e424fee5ad55a61bea519aa75e47f')

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
