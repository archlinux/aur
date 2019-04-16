# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
# Contributor: Chris Warner <inhies@gmail.com>
# Contributor: Kevin MacMartin <prurigro@gmail.com>
# Contributor: Ju <ju@heisec.de>
pkgname=chkboot
pkgver=1.3
pkgrel=1
pkgdesc="Create hashes of all files under /boot and warns the user if they are modified"
arch=('any')
url="https://github.com/grazzolini/chkboot"
license=('GPL')
depends=('bash' 'util-linux')
makedepends=()
checkdepends=()
optdepends=('zenity: Graphical notifications'
            'xorg-xmessage: Graphical notifications')
backup=('etc/default/chkboot.conf')
install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('fde68a14ef4d8b30c2212e2676d317ffa4b6fe96933d16ba87c1632728cff0b975cd06120bf117fa6928ac1dcf21a35f8b1144f93d22e2ba7abacd08ff527d7a')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/chkboot.conf"                             "$pkgdir/etc/default/chkboot.conf"
  install -Dm755 "$srcdir/$pkgname-$pkgver/notification/chkboot-profilealert.sh"     "$pkgdir/etc/profile.d/chkboot-profilealert.sh"
  install -Dm755 "$srcdir/$pkgname-$pkgver/chkboot"      		             "$pkgdir/usr/bin/chkboot"
  install -Dm755 "$srcdir/$pkgname-$pkgver/chkboot-check"      		             "$pkgdir/usr/bin/chkboot-check"
  install -Dm755 "$srcdir/$pkgname-$pkgver/notification/chkboot-desktopalert"        "$pkgdir/usr/bin/chkboot-desktopalert"
  install -Dm644 "$srcdir/$pkgname-$pkgver/mkinitcpio-hooks/chkboot-initcpio"        "$pkgdir/usr/lib/initcpio/install/chkboot"
  install -Dm755 "$srcdir/$pkgname-$pkgver/chkboot-bootcheck"                        "$pkgdir/usr/lib/systemd/scripts/chkboot-bootcheck"
  install -Dm644 "$srcdir/$pkgname-$pkgver/chkboot.service" 		             "$pkgdir/usr/lib/systemd/system/chkboot.service"
  install -Dm644 "$srcdir/$pkgname-$pkgver/pacman-hooks/80-chkboot-check.hook"       "$pkgdir/usr/share/libalpm/hooks/80-chkboot-check.hook"
  install -Dm644 "$srcdir/$pkgname-$pkgver/pacman-hooks/99-chkboot-update.hook"      "$pkgdir/usr/share/libalpm/hooks/99-chkboot-update.hook"
}
