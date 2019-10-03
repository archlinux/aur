# Maintainer: Samuel Walladge <samuel+aur@swalladge.net>
# Contributor: Varakh <varakh@varakh.de>

pkgname=spotifyd-full-git
pkgver=0.2.17.7.g8a82bec
pkgrel=1
arch=('x86_64' 'armv7h' 'aarch64')
depends=('libpulse' 'portaudio')
license=('GPL3')
makedepends=('git' 'cargo' 'libpulse' 'dbus')
conflicts=('spotifyd' 'spotifyd-pulseaudio' 'spotifyd-git' 'spotifyd-bin' 'spotifyd-pulseaudio-git')
provides=('spotifyd')
pkgdesc="A spotify playing daemon (all features enabled)"
url="https://github.com/Spotifyd/spotifyd"
source=("spotifyd::git+https://github.com/Spotifyd/spotifyd")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/spotifyd;
  git describe --tags --match 'v*' | sed 's/^v//;s/-/./g'
}

build() {
  cd $srcdir/spotifyd;
  cargo build --release --all-features
}

package() {
  install -D -m 755 "$srcdir/spotifyd/target/release/spotifyd" "${pkgdir}/usr/bin/spotifyd"
  install -D -m 644 "$srcdir/spotifyd/contrib/spotifyd.service" "${pkgdir}/usr/lib/systemd/user/spotifyd.service"
}
