# Maintainer: Hetsh <aur@hetsh.de>

pkgname=mcsctl-git
pkgver=master
commit=('d2b579bbd2f977a7547405135f04d3a0be6c2add')
pkgrel=3
pkgdesc='Manage multiple minecraft servers with a simple bash script and systemd unit template.'
arch=('x86_64')
url='https://github.com/Hetsh/mcsctl'
license=('GPL3')
depends=('bash' 'grep' 'java-runtime-headless>=8' 'screen' 'sudo' 'systemd')
provides=('mcsctl')
conflicts=('mcsctl')
install="$pkgname.install"
source=("$url/archive/$commit.tar.gz")
sha256sums=('cfe60c3f6de7ce47fd314123f167583c132ff92ba27689d01445e4470b07b0f0')

package() {
	install -Dm 644 "$srcdir/${pkgname%-git}-$commit/mcs@.service" "$pkgdir/usr/lib/systemd/system/mcs@.service"
	install -Dm 755 "$srcdir/${pkgname%-git}-$commit/mcsctl.sh" "$pkgdir/usr/bin/mcsctl"
	
	# Generate an example config file from default options inside the mcsctl script
	sed -n '/\# Mutable config/,/\# \/Mutable config/p' "$srcdir/${pkgname%-git}-$commit/mcsctl.sh" | head -n -1 | tail -n +2 > "$srcdir/${pkgname%-git}-$commit/mcsctl.conf.bak"
	install -Dm 644 "$srcdir/${pkgname%-git}-$commit/mcsctl.conf.bak" "$pkgdir/etc/mcsctl.conf.bak"
}