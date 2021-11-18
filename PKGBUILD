# Maintainer: Philipp A. <flying-sheep@web.de>

pkgname=camset
pkgver=0.0.19
pkgrel=1
pkgdesc='GUI for v4l2-ctl'
arch=(any)
provides=($pkgname python-$pkgname)
url="https://github.com/azeam/$pkgname"
license=(GPL3)
depends=(python python-opencv python-gobject v4l-utils pkgconf)
makedepends=(install-wheel-scripts unzip)
_wheel="$pkgname-$pkgver-py3-none-any.whl"
source=("https://files.pythonhosted.org/packages/py3/${pkgname::1}/$pkgname/$_wheel")
sha256sums=('e092fc77268796bbd676440cd179855304dc422f3c03b3c414a5ba26ec91271b')
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
