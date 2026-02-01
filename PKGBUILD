pkgname=wtmpdb
pkgver=0.75.0
pkgrel=1
pkgdesc="Login/logout event log (SQLite-based replacement of /var/log/wtmp)"
arch=(x86_64)
depends=(audit gcc-libs pam sqlite libsystemd)
makedepends=(meson)
url=https://github.com/thkukuk/wtmpdb
#source=(git+https://github.com/thkukuk/wtmpdb#tag=v$pkgver)
source=(git+https://github.com/thkukuk/wtmpdb#commit=5214d883817d47343cbb1bcf4fe02805a0fc4085)
sha256sums=('e5bd9819cb47af51257916150def73fc8bc4d331299aa83670f7a42a473fd40c')

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
