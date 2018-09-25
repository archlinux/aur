# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
pkgname=pitrery
pkgver=2.2
pkgrel=1
pkgdesc="Point In Time Recovery tools for PostgreSQL"
arch=("any")
depends=("bash")
optdepends=("openssh: used for remote backups" "rsync: used for network WAL archiving")
url="https://dalibo.github.io/pitrery/"
license=("BSD")
backup=('etc/pitrery/pitrery.conf')
source=("https://dl.dalibo.com/public/pitrery/pitrery-$pkgver.tar.gz" 
        "https://dl.dalibo.com/public/pitrery/pitrery-$pkgver.tar.gz.asc")
sha256sums=("eb54a2a9e5168067f2e87525ce86ae98b836a9fe7491f15a2bb37964bd2b3470"
            "3143a1535d03267ba8ecc37b72b58683777c185a5bbd58fa3e3cdc4399e68ab8")
validpgpkeys=("A9C12688B6D6A1A66A9FE2BC36B6559CD664AA4D")

build() {
	cd "$pkgname-$pkgver"
	sed -i  's@PREFIX = /usr/local@PREFIX = /usr@;s@SYSCONFDIR = ${PREFIX}/etc/${NAME}@SYSCONFDIR = /etc/${NAME}@' config.mk
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
