# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=systemd-manager
pkgver=1.0.0
pkgrel=1
pkgdesc="GUI manager for systemd services, using GTK+3"
arch=('i686' 'x86_64')
url="https://github.com/mmstick/systemd-manager"
license=('MIT')
depends=('gtk3')
makedepends=('cargo')
conflicts=('systemd-manager-git')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('035bc96d13f873ed29463ef9c20988a6670dcb0b05cc4384089a81dbbc226a47')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 target/release/systemd-manager -t "$pkgdir/usr/bin"
  install -Dm 755 assets/systemd-manager-pkexec -t "$pkgdir/usr/bin"
  install -Dm 644 assets/systemd-manager.desktop -t "$pkgdir/usr/share/applications"
  install -Dm 644 assets/org.freedesktop.policykit.systemd-manager.policy -t "$pkgdir/usr/share/polkit-1/actions"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/systemd-manager/COPYING"
}
