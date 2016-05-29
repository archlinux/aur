# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=systemd-manager
pkgver=0.4.5
pkgrel=1
pkgdesc="A program written with Rust that allows the user to manage their systemd services via a GTK3 GUI."
arch=('i686' 'x86_64')
url="https://github.com/mmstick/systemd-manager"
license=('GPL3')
depends=('gtk3')
makedepends=('cargo')
conflicts=('systemd-manager-git')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('7358fce5be146d43f2908b582c96ae2da9a20f17cd5e760f486bbda4e4af77f4')

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
