# Maintainer: Hetsh <aur@hetsh.de>

pkgname=mcsctl
pkgver=1.3.0
pkgrel=1
pkgdesc='Manage multiple minecraft servers with a simple bash script and systemd unit template.'
arch=('x86_64')
url='https://github.com/Hetsh/mcsctl'
license=('GPL3')
depends=('bash' 'grep' 'java-runtime-headless>=8' 'jq' 'screen' 'sudo' 'systemd')
provides=('mcsctl')
conflicts=('mcsctl-git')
install="$pkgname.install"
source=("https://github.com/Hetsh/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('2b2200f19a6e50d55bfe63e18c406c700fb3be036577d6ea3d626908c2f5dbc6')

package() {
	install -Dm 644 "$srcdir/$pkgname-$pkgver/mcs@.service" "$pkgdir/usr/lib/systemd/system/mcs@.service"
	install -Dm 755 "$srcdir/$pkgname-$pkgver/mcsctl.sh" "$pkgdir/usr/bin/mcsctl"
	
	# Generate an example config file from default options inside the mcsctl script
	sed -n '/\# Mutable config/,/\# \/Mutable config/p' "$srcdir/$pkgname-$pkgver/mcsctl.sh" | head -n -1 | tail -n +2 > "$srcdir/$pkgname-$pkgver/mcsctl.conf.bak"
	install -Dm 644 "$srcdir/$pkgname-$pkgver/mcsctl.conf.bak" "$pkgdir/etc/mcsctl.conf.bak"
}