# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=camset
pkgver=0.0.13
pkgrel=2
pkgdesc='GUI for v4l2-ctl'
arch=(any)
provides=($pkgname python-$pkgname)
url="https://github.com/azeam/$pkgname"
license=(GPL3)
depends=(python python-opencv python-gobject v4l-utils pkgconf)
makedepends=(install-wheel-scripts)
_wheel="$pkgname-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('09bc128890c7f6567198a672887b6999ac16d3b6a7b312db57974bdb4fe33cc5')
noextract=("$_wheel")

package() {
	local site="$pkgdir/usr/lib/$(readlink /bin/python3)/site-packages"
	install -d "$site" "$pkgdir/usr/share"
	# python package
	unzip "$_wheel" -x "$pkgname-$pkgver.data/*" -d "$site"
	# binary
	install-wheel-scripts --prefix="$pkgdir/usr" "$_wheel"
	# data
	unzip "$_wheel" "$pkgname-$pkgver.data/*" -d "$pkgdir/usr"
	mv "$pkgdir/usr/$pkgname-$pkgver.data/data/"* "$pkgdir/usr"
	rmdir "$pkgdir/usr/$pkgname-$pkgver.data"{/data,}
	chmod +x "$pkgdir/usr/share/applications/camset.desktop"
}
