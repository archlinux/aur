# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=systemd-manager
pkgver=0.4.6
pkgrel=1
pkgdesc="A program written with Rust that allows the user to manage their systemd services via a GTK3 GUI."
arch=('i686' 'x86_64')
url="https://github.com/mmstick/systemd-manager"
license=('GPL3')
depends=('gtk3')
makedepends=('cargo')
conflicts=('systemd-manager-git')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('1de9fe1bb13521df3580499851a32003e8909887587fe037946ded30374c67e5')

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
