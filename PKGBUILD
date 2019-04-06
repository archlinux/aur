# Maintainer: Hetsh <aur@hetsh.de>

pkgname=mcsctl-git
pkgver=master
commit=('f68b0cc3900574eb4e7df51752826790775f640b')
pkgrel=7
pkgdesc='Manage multiple minecraft servers with a simple bash script and systemd unit template.'
arch=('any')
url='https://github.com/Hetsh/mcsctl'
license=('GPL3')
depends=('bash' 'grep' 'java-runtime-headless>=8' 'jq' 'screen' 'sudo' 'systemd')
provides=('mcsctl')
conflicts=('mcsctl')
install="$pkgname.install"
source=("$url/archive/$commit.tar.gz")
sha256sums=('a983d81686529603d08de87eaec3ef0a27f4a5903bcd29d96ab5c828a6f8c806')

package() {
	install -Dm 644 "$srcdir/${pkgname%-git}-$commit/mcs@.service" "$pkgdir/usr/lib/systemd/system/mcs@.service"
	install -Dm 755 "$srcdir/${pkgname%-git}-$commit/mcsctl.sh" "$pkgdir/usr/bin/mcsctl"
	
	# Generate an example config file from default options inside the mcsctl script
	sed -n '/\# Mutable config/,/\# \/Mutable config/p' "$srcdir/${pkgname%-git}-$commit/mcsctl.sh" | head -n -1 | tail -n +2 > "$srcdir/${pkgname%-git}-$commit/mcsctl.conf.bak"
	install -Dm 644 "$srcdir/${pkgname%-git}-$commit/mcsctl.conf.bak" "$pkgdir/etc/mcsctl.conf.bak"
}