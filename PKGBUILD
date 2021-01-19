# Contributor: ugjka <ugis.germanis@gmail.com>
# Contributor: Bill Sun <billksun@gmail.com>
# Contributor: magnific0
# Contributor: Troy Engel <troyengel+arch@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=wondershaper-git
pkgver=r41.67473d4
pkgrel=1
pkgdesc="Command-line utility for limiting an adapter's bandwidth"
arch=('any')
url="https://github.com/magnific0/wondershaper"
license=('GPL')
depends=('iproute')
makedepends=('git')
backup=('etc/conf.d/wondershaper.conf')
source=("$pkgname::git+$url")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's!/etc/systemd/wondershaper.conf!/etc/conf.d/wondershaper.conf!' wondershaper.service
}

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 wondershaper "$pkgdir/usr/bin/wondershaper"
	install -D -m644 wondershaper.service "${pkgdir}/usr/lib/systemd/system/wondershaper.service"
	install -D -m644 wondershaper.conf "${pkgdir}/etc/conf.d/wondershaper.conf"
}
