# Maintainer: Hetsh <aur@hetsh.de>

pkgname=mcsctl-git
pkgver=master
commit=('709324ea158fcd780b3ee749106193231a21e259')
pkgrel=4
pkgdesc='Manage multiple minecraft servers with a simple bash script and systemd unit template.'
arch=('x86_64')
url='https://github.com/Hetsh/mcsctl'
license=('GPL3')
depends=('bash' 'grep' 'java-runtime-headless>=8' 'jq' 'screen' 'sudo' 'systemd')
provides=('mcsctl')
conflicts=('mcsctl')
install="$pkgname.install"
source=("$url/archive/$commit.tar.gz")
sha256sums=('fd294d11f6a7756bae2137bb35e9aefee2f37d8e204bf2200874dee5e64e997c')

package() {
	install -Dm 644 "$srcdir/${pkgname%-git}-$commit/mcs@.service" "$pkgdir/usr/lib/systemd/system/mcs@.service"
	install -Dm 755 "$srcdir/${pkgname%-git}-$commit/mcsctl.sh" "$pkgdir/usr/bin/mcsctl"
	
	# Generate an example config file from default options inside the mcsctl script
	sed -n '/\# Mutable config/,/\# \/Mutable config/p' "$srcdir/${pkgname%-git}-$commit/mcsctl.sh" | head -n -1 | tail -n +2 > "$srcdir/${pkgname%-git}-$commit/mcsctl.conf.bak"
	install -Dm 644 "$srcdir/${pkgname%-git}-$commit/mcsctl.conf.bak" "$pkgdir/etc/mcsctl.conf.bak"
}