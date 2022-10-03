# Maintainer: Sameer Puri <aur@purisa.me>
pkgname=wl-mpris-idle-inhibit
pkgver=0.1.8
pkgrel=1
pkgdesc='Wayland Idle Inhibitor using MPRIS2 as a signal'
url="https://github.com/sameer/$pkgname"
source=("$pkgname-$pkgver.tar.gz::https://github.com/sameer/wl-mpris-idle-inhibit/archive/refs/tags/$pkgver.tar.gz")
arch=('i686' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('MIT' 'APACHE')
makedepends=('git' 'cargo' 'wayland' 'wayland-protocols' 'dbus')
depends=('wayland' 'dbus')
optdepends=('swayidle: Idle management daemon')
replaces=('sway-mpris-idle-inhibit')
conflicts=('sway-mpris-idle-inhibit')
b2sums=('SKIP')

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
  ln -s ./$pkgname "${pkgdir}/usr/bin/sway-mpris-idle-inhibit"
}
