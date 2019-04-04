# Maintainer: Hetsh <aur@hetsh.de>

pkgname=mcsctl-git
pkgver=master
commit=('402c6a1b50c42e159f2ea44024a3c4215c8b26c2')
pkgrel=5
pkgdesc='Manage multiple minecraft servers with a simple bash script and systemd unit template.'
arch=('any')
url='https://github.com/Hetsh/mcsctl'
license=('GPL3')
depends=('bash' 'grep' 'java-runtime-headless>=8' 'jq' 'screen' 'sudo' 'systemd')
provides=('mcsctl')
conflicts=('mcsctl')
install="$pkgname.install"
source=("$url/archive/$commit.tar.gz")
sha256sums=('c7517da6d48df29f6e1a7972e63d3cc7f7172e8af59b0edc7e4eac724ae6b20f')

package() {
	install -Dm 644 "$srcdir/${pkgname%-git}-$commit/mcs@.service" "$pkgdir/usr/lib/systemd/system/mcs@.service"
	install -Dm 755 "$srcdir/${pkgname%-git}-$commit/mcsctl.sh" "$pkgdir/usr/bin/mcsctl"
	
	# Generate an example config file from default options inside the mcsctl script
	sed -n '/\# Mutable config/,/\# \/Mutable config/p' "$srcdir/${pkgname%-git}-$commit/mcsctl.sh" | head -n -1 | tail -n +2 > "$srcdir/${pkgname%-git}-$commit/mcsctl.conf.bak"
	install -Dm 644 "$srcdir/${pkgname%-git}-$commit/mcsctl.conf.bak" "$pkgdir/etc/mcsctl.conf.bak"
}