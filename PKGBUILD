# Maintainer: Sameer Puri <aur@purisa.me>
pkgname=sway-mpris-idle-inhibit
pkgver=0.1.1
pkgrel=1
pkgdesc='Sway Idle Inhibitor using MPRIS2 as a signal'
url="https://github.com/sameer/$pkgname"
source=("$pkgname-$pkgver.tar.gz::https://github.com/sameer/sway-mpris-idle-inhibit/archive/refs/tags/$pkgver.tar.gz")
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('MIT' 'APACHE')
makedepends=('git' 'cargo' 'wayland' 'wayland-protocols')
depends=('wayland')
optdepends=('swayidle: Idle management daemon')
b2sums=('f33837327700da2e68f4bd7a654dbaafb84c17e0a41becf77d9f92466a2e2e2c229da7f9e7ef239bbc7b300c7d48908606b6236a5722da90a9251aab40551e0b')

build () {
  cd "$srcdir/$pkgname-$pkgver"

  if [[ $CARCH != x86_64 ]]; then
    export CARGO_PROFILE_RELEASE_LTO=off
  fi

  cargo build --locked --release --target-dir target
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 target/release/$pkgname "${pkgdir}/usr/bin/$pkgname"
}
