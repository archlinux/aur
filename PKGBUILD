# Maintainer: Hetsh <aur@hetsh.de>

pkgname=mcsctl-git
pkgver=master
commit=('ceef84ff173b50f7aa6b5d21a5db38642b42b4fe')
pkgrel=6
pkgdesc='Manage multiple minecraft servers with a simple bash script and systemd unit template.'
arch=('any')
url='https://github.com/Hetsh/mcsctl'
license=('GPL3')
depends=('bash' 'grep' 'java-runtime-headless>=8' 'jq' 'screen' 'sudo' 'systemd')
provides=('mcsctl')
conflicts=('mcsctl')
install="$pkgname.install"
source=("$url/archive/$commit.tar.gz")
sha256sums=('9e565f5e91bb6c34c063f9192c0329e108c128e1040df16df22c28a4d6c8646a')

package() {
	install -Dm 644 "$srcdir/${pkgname%-git}-$commit/mcs@.service" "$pkgdir/usr/lib/systemd/system/mcs@.service"
	install -Dm 755 "$srcdir/${pkgname%-git}-$commit/mcsctl.sh" "$pkgdir/usr/bin/mcsctl"
	
	# Generate an example config file from default options inside the mcsctl script
	sed -n '/\# Mutable config/,/\# \/Mutable config/p' "$srcdir/${pkgname%-git}-$commit/mcsctl.sh" | head -n -1 | tail -n +2 > "$srcdir/${pkgname%-git}-$commit/mcsctl.conf.bak"
	install -Dm 644 "$srcdir/${pkgname%-git}-$commit/mcsctl.conf.bak" "$pkgdir/etc/mcsctl.conf.bak"
}