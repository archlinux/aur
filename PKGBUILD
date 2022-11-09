# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Tyler Murphy <tylermurphy534@gmail.com>
pkgname=crab
pkgver=0.0.3
pkgrel=1
pkgdesc="A rusty permission authentication system"
arch=('x86_64' 'i686')
url="https://g.tylerm.dev/tylermurphy534/crab.git"
license=('GPL3')
makedepends=('cargo')
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
