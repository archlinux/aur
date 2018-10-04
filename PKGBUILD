# Maintainer: James R. <justsomejames@gmail.com>
pkgname=amount
pkgver=1.5.1
pkgrel=4
pkgdesc="Filesystem mounting utility for ordinary users."
license=('custom')
arch=('any')
depends=('bash' 'coreutils' 'util-linux' 'procps-ng' 'shadow')
optdepends=('systemd: systemd service support')
provides=('amount')
url="https://www.jameds.org/amount/"
source=("https://www.jameds.org/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('08fb78d224c5d75eeec3ce902c98e625')
install="$pkgname.install"

build()
{
	cd "$pkgname-$pkgver"

	sed 's-\$prefix-\$pkgdir/&-g' < install.sh > install.sh.new
	sed 's-\(eprefix=.*\)\$pkgdir/-\1-' < install.sh.new > install.sh
	rm install.sh.new
}

package()
{
	cd "$pkgname-$pkgver"

	export pkgdir ; install -d -m 755 "$pkgdir/usr/bin"
	./install.sh /usr

	install -d -m 755 "$pkgdir/usr/share/licenses/$pkgname"
	./amountd -l > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	chmod 644 "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
