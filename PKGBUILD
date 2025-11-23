# Maintainer: Carlos Eduardo <carana2099@gmail.com>
pkgbase=xchpst
pkgname=(xchpst xchpst-compat)
pkgver=0.7.2
pkgrel=1
epoch=
pkgdesc="A backwards-compatible chpst implementation with new hardening options using namespaces and capabilities"
arch=(x86_64)
url="https://gitlab.com/init-tools/xchpst"
license=('MIT')
groups=()
depends=(libcap)
makedepends=('make')
source=("https://gitlab.com/init-tools/xchpst/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
noextract=()
sha256sums=('edbcfa8557791652f26f19eb5d124bca259bdd564fc11f62820b5728d5357a56')
validpgpkeys=()

prepare() {
	cd "$pkgname-v$pkgver"
}


build() {
	cd "$pkgname-v$pkgver"
	make
}

package_xchpst() {
	cd "$pkgname-v$pkgver"
	make prefix=/usr DESTDIR="$pkgdir/" install
	find "$pkgdir" -type l -delete
}

package_xchpst-compat() {
	pkgdesc+=" (compat symlinks)"
	depends=(xchpst)
	mkdir -p "$pkgdir/usr/bin"
	find . -type l -exec install -Dm755 -t "$_" {} \;
}
