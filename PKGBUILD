# Maintainer: WilssonMartee <wilssonm@gmail.com>
pkgname=mac-fan-control
pkgver=1
pkgrel=1
pkgdesc="Fan control for Mac devices"
arch=('any')
license=('GPL3')
makedepends=('git')
provides=("${pkgname}")
options=(!strip !emptydirs)
backup=(etc/mac-fan-control.conf)
source=("${pkgname}::git+https://git.ogenos.org/wilssonmartee/${pkgname}")
sha256sums=('SKIP')

prepare() {
rm -rf "$srcdir/$pkgname/.git"
}

package() {
	install -dm755 "$pkgdir/usr/share/$pkgname"
	cp -rf "$srcdir/$pkgname/scripts/"* "$pkgdir/usr/share/$pkgname"

	install -dm755 "$pkgdir/usr/bin"
	cp -rf "$srcdir/$pkgname/bin/"* "$pkgdir/usr/bin/"
	
	install -dm755 "$pkgdir/etc/systemd/system"
	cp -rf "$srcdir/$pkgname/services/"* "$pkgdir/etc/systemd/system/"

	install -dm755 "$pkgdir/etc"
	cp -rf "$srcdir/$pkgname/conf/"* "$pkgdir/etc/"

	install=post.install
}
