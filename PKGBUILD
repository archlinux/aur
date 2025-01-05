# Maintainer: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgname=cosmic-ext-applet-cpu-temperature
pkgver=1.0.0
pkgrel=1
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url='https://github.com/Gr3q/cosmic-ext-applet-cpu-temperature'
license=('GPL2')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Gr3q/cosmic-ext-applet-cpu-temperature/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('d47871b3db0009edfa749c5c7beeface4ad7a5d6f485fcaef97ee67ed3bf23d484f0e8189620dd2f0ec2a1b170da492360f8abbfacdd0edc09cd2aaf3f67eca7')

build () {
  cd "$srcdir/$pkgname-$pkgver"

  if [[ $CARCH != x86_64 ]]; then
    export CARGO_PROFILE_RELEASE_LTO=off
  fi

  cargo build --frozen --features "${_features:-}" --release --target-dir target
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/cosmic-ext-applet-cpu-temperature "${pkgdir}/usr/bin/cosmic-ext-applet-cpu-temperature"
  install -Dm644 data/usr/share/applications/cosmic-ext-applet-cpu-temperature.desktop "${pkgdir}/usr/share/applications/cosmic-ext-applet-cpu-temperature.desktop"

  install -Dm644 data/usr/share/icons/thermometer-symbolic.svg "$pkgdir/usr/share/icons/thermometer-symbolic.svg"

  install -d "$pkgdir/usr/share/"
}