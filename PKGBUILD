# Maintainer: Tyler Murphy <tylermurphy534@gmail.com>
pkgname=crab
pkgver=0.0.5
pkgrel=2
pkgdesc="A rusty permission authentication system"
arch=('x86_64' 'i686')
url="https://g.tylerm.dev/tylermurphy534/crab.git"
license=('GPL3')
makedepends=('git' 'cargo')
depends=('glibc' 'pam')
source=("git+$url")
md5sums=('SKIP')

build() {
  cd crab
  cargo build --release
}

package() {
  cd crab
  install -D --mode=6755 --owner=root --group=root ./target/release/crab ${pkgdir}/usr/bin/crab
  install -D --mode=660 --owner=root --group=root pam ${pkgdir}/etc/pam.d/crab
  install -D --mode=660 --owner=root --group=root conf ${pkgdir}/usr/share/crab/crab.conf
}
