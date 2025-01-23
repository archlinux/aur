# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgname=cosmic-ext-applet-cpu-temperature
pkgdesc='CPU Temperature Applet for the Cosmic Desktop environment'
pkgver=1.0.2
pkgrel=1
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/Gr3q/cosmic-ext-applet-cpu-temperature'
license=('GPL2')
makedepends=('cargo')
depends=('libxkbcommon')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Gr3q/cosmic-ext-applet-cpu-temperature/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('d880dba591e1c64ea2bf37b724d593c4d02050621f36e2cf97323acfead3a5336bf6c171dcd5c687cc15ca78d206adee506e57744fa2c7a7066d438f7c04a376')

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
