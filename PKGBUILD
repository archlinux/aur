# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=systemd-manager
pkgver=0.4.6
pkgrel=2
pkgdesc="GUI manager for systemd services, using GTK+3"
arch=('i686' 'x86_64')
url="https://github.com/mmstick/systemd-manager"
license=('GPL3')
depends=('gtk3')
makedepends=('cargo')
conflicts=('systemd-manager-git')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('de14c40f5ac53caf2f06df8ad7c329101748c8082651e85bf612f3a65c1a4fef')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/polkit-1/actions"
  install -m 755 target/release/systemd-manager "$pkgdir/usr/bin"
  install -m 755 assets/systemd-manager-pkexec "$pkgdir/usr/bin"
  install -m 644 assets/systemd-manager.desktop "$pkgdir/usr/share/applications"
  install -m 644 assets/org.freedesktop.policykit.systemd-manager.policy "$pkgdir/usr/share/polkit-1/actions"
}
