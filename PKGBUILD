pkgname=onagre-git
pkgver=0.1.0.r79.g217e815
pkgrel=1
pkgdesc='A general purpose application launcher for X and wayland inspired by rofi/wofi and alfred'
arch=('x86_64')
url='https://github.com/oknozor/onagre'
license=('MIT')
makedepends=('git' 'rust')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
#install="${pkgname%-*}.install"
source=("${pkgname%-*}::git+$url")
sha1sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).r$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
  cd "${pkgname%-*}"
  cargo build --release
}

package() {
  cd "${pkgname%-*}"
  install -Dm755 target/release/onagre "$pkgdir/usr/bin/onagre"
}
