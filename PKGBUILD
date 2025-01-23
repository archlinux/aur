# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgname=cosmic-ext-applet-cpu-temperature
pkgdesc='CPU Temperature Applet for the Cosmic Desktop environment'
pkgver=1.0.1
pkgrel=3
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/Gr3q/cosmic-ext-applet-cpu-temperature'
license=('GPL2')
makedepends=('cargo')
depends=('libxkbcommon')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Gr3q/cosmic-ext-applet-cpu-temperature/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('fbf6d20efd4d3d8c5eda9189a0a7af4315134dcb4d929a99dbdd5143e1e25952304ec469916a21423664ca958bd88f9ef9de6850f9006c6f975fe4e494bd0bca')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  if [[ $CARCH != x86_64 ]]; then
    export CARGO_PROFILE_RELEASE_LTO=off
  fi

  cargo build --features "${_features:-}" --release --target-dir target
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/cosmic-ext-applet-cpu-temperature "${pkgdir}/usr/bin/cosmic-ext-applet-cpu-temperature"
  install -Dm644 data/usr/share/applications/cosmic-ext-applet-cpu-temperature.desktop "${pkgdir}/usr/share/applications/cosmic-ext-applet-cpu-temperature.desktop"

  install -Dm644 data/usr/share/icons/thermometer-symbolic.svg "$pkgdir/usr/share/icons/thermometer-symbolic.svg"

  install -d "$pkgdir/usr/share/"
}
