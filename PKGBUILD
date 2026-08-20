pkgname=wtmpdb
pkgver=0.76.0
pkgrel=1
pkgdesc="Login/logout event log (SQLite-based replacement of /var/log/wtmp)"
arch=(x86_64)
depends=(audit pam sqlite libgcc libsystemd)
makedepends=(meson)
url=https://github.com/thkukuk/wtmpdb
source=(git+https://github.com/thkukuk/wtmpdb#tag=v$pkgver)
#source=(git+https://github.com/thkukuk/wtmpdb#commit=5214d883817d47343cbb1bcf4fe02805a0fc4085)
sha256sums=('f3865d566fc8c4c58a143cbe907138ddec6770c7d429f60738f98aa0e7f7f842')

#pkgver() {
#	cd $pkgname
#	git describe --tags | sed "s/^v//; s/-/.r/; s/-/./"
#}

build() {
	arch-meson $pkgname build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
