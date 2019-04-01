# Maintainer: Hetsh <aur@hetsh.de>

pkgname=mcsctl
pkgver=1.2.0
pkgrel=1
pkgdesc='Manage multiple minecraft servers with a simple bash script and systemd unit template.'
arch=('x86_64')
url='https://github.com/Hetsh/mcsctl'
license=('GPL3')
depends=('bash' 'grep' 'java-runtime-headless>=8' 'screen' 'sudo' 'systemd')
provides=('mcsctl')
conflicts=('mcsctl-git')
install="$pkgname.install"
source=("https://github.com/Hetsh/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('60866debbab46b255fd1e7808aa17b3aa0af02507d7f54b4620f7bfe7f43f59f')

package() {
	install -Dm 644 "$srcdir/$pkgname-$pkgver/mcs@.service" "$pkgdir/usr/lib/systemd/system/mcs@.service"
	install -Dm 755 "$srcdir/$pkgname-$pkgver/mcsctl.sh" "$pkgdir/usr/bin/mcsctl"
	
	# Generate an example config file from default options inside the mcsctl script
	sed -n '/\# Mutable config/,/\# \/Mutable config/p' "$srcdir/$pkgname-$pkgver/mcsctl.sh" | head -n -1 | tail -n +2 > "$srcdir/$pkgname-$pkgver/mcsctl.conf.bak"
	install -Dm 644 "$srcdir/$pkgname-$pkgver/mcsctl.conf.bak" "$pkgdir/etc/mcsctl.conf.bak"
}