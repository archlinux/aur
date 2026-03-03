# Maintainer: Carlos Eduardo <carana2099@gmail.com>
pkgbase=xchpst
pkgname=(xchpst xchpst-compat)
pkgver=0.8.2
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
sha256sums=('63929a5a188e4c9cac5b011600d6d75748401c9975c61440c08d82ed32aa94bc')
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
	install -vDm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -vd "$pkgdir/usr/share/doc/$pkgname"
	install -vm644 README.md CHANGELOG "$_"
	find "$pkgdir" -type l -delete
}

package_xchpst-compat() {
	pkgdesc+=" (compat symlinks)"
	depends=(xchpst)
	mkdir -p "$pkgdir/usr/bin"
	find . -type l -exec install -Dm755 -t "$_" {} \;
}
