# Maintainer: Giancarlo Razzolini <grazzolini@gmail.com>
# Contributor: Chris Warner <inhies@gmail.com>
# Contributor: Kevin MacMartin <prurigro@gmail.com>
# Contributor: Ju <ju@heisec.de>
pkgname=chkboot
pkgver=1.2
pkgrel=1
pkgdesc="Create hashes of all files under /boot and warns the user if they are modified"
arch=('any')
url="https://github.com/grazzolini/chkboot"
license=('GPL')
depends=('bash')
makedepends=()
checkdepends=()
optdepends=('zenity: Graphical notifications'
            'xorg-xmessage: Graphical notifications')
provides=('chkboot-git')
conflicts=('chkboot-git')
replaces=('chkboot-git')
backup=('etc/default/chkboot.conf')
install=$pkgname.install
source=("$pkgname.install"
	"$url/archive/v$pkgver.tar.gz")
sha512sums=('617a17718ea5b89413e38db958d8bd28804c95e90c42137e398b84463957e4d10ae5e03ef15f227b155f9a9f840468c9159d59bd968d6e2bcf38b0e6b0c937b5'
            '91a2ab434e43ef0c577f1a6c55ee376f6466b2da9ff0ea81bb63f4ede3bcf7b24bcd5a594f059a5916e5cee4c7cf0e746a499a3c9afee9e72df02aeee824a32d')

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/chkboot.conf"			"$pkgdir/etc/default/chkboot.conf"
  install -Dm755 "$srcdir/$pkgname-$pkgver/chkboot-profilealert.sh"      "$pkgdir/etc/profile.d/chkboot-profilealert.sh"
  install -Dm755 "$srcdir/$pkgname-$pkgver/chkboot"      		"$pkgdir/usr/bin/chkboot"
  install -Dm755 "$srcdir/$pkgname-$pkgver/chkboot-check"      		"$pkgdir/usr/bin/chkboot-check"
  install -Dm755 "$srcdir/$pkgname-$pkgver/chkboot-desktopalert"        "$pkgdir/usr/bin/chkboot-desktopalert"
  install -Dm644 "$srcdir/$pkgname-$pkgver/chkboot-initcpio"   		"$pkgdir/usr/lib/initcpio/install/chkboot"
  install -Dm755 "$srcdir/$pkgname-$pkgver/chkboot-bootcheck" 		"$pkgdir/usr/lib/systemd/scripts/chkboot-bootcheck"
  install -Dm644 "$srcdir/$pkgname-$pkgver/chkboot.service" 		"$pkgdir/usr/lib/systemd/system/chkboot.service"
}
