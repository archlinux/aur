# Maintainer: Pierre-Alain TORET <pierre-alain.toret@protonmail.com>
pkgname=pitrery
pkgver=2.1
pkgrel=1
pkgdesc="Point In Time Recovery tools for PostgreSQL"
arch=("any")
depends=("bash")
optdepends=("openssh: used for remote backups" "rsync: used for network WAL archiving")
url="https://dalibo.github.io/pitrery/"
license=("BSD")
backup=('etc/pitrery/pitrery.conf')
source=("https://dl.dalibo.com/public/pitrery/pitrery-$pkgver.tar.gz" "https://dl.dalibo.com/public/pitrery/pitrery-$pkgver.tar.gz.asc")
sha256sums=("465b8aa803df053d7d8f462625b235b67b537f9cd982059af768e999046d2d73" "1d89a75a79fd7b0df933312913bf256a11ac7f6d524eade1ad8ae7609343d36d")
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
