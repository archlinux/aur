# Maintainer: jeffmhubbard <jeffmhubbard@gmail.com>
# Contributor: AUTplayed <fips.hem@gmail.com>
# Contributor: pavanjadhaw <pavanjadhaw96@gmail.com>
pkgname=multilockscreen
pkgver=1.0.0
pkgrel=2
pkgdesc="A simple lock script for i3lock-color"
arch=('any')
url="https://github.com/jeffmhubbard/multilockscreen"
license=('MIT')
depends=('i3lock-color' 'imagemagick' 'xorg-xrandr' 'xorg-xdpyinfo' 'bc' 'feh')
conflicts=('multilockscreen-git')
source=("https://github.com/jeffmhubbard/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('f07e0246737c48a2cf373b9f5393dc3b')
install=$pkgname.install

package() {
	_srcdir="$srcdir/$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	cp "$_srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
	if [[ $(pidof systemd) ]]; then
		_serviceloc="$pkgdir/usr/lib/systemd/system"
		mkdir -p "$_serviceloc"
		_servicename="$pkgname@.service"
		cp "$_srcdir/system/$_servicename" "$_serviceloc/$_servicename"
	fi
	mkdir -p "$pkgdir/usr/share/doc/$pkgname/examples"
	cp "$_srcdir/examples/config" "$pkgdir/usr/share/doc/$pkgname/examples/config"
	install -Dm644 "$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
