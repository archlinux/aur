# Maintainer: Jacob Mischka <jacob@mischka.me>

pkgname=gnomecast-git
pkgver=r16.8c08e60
pkgrel=1
pkgdesc='A native Linux GUI for Chromecasting local files.'
arch=('x86_64')
url='https://github.com/keredson/gnomecast'
license=('GPL-3.0')
depends=('gtk3' 'python' 'ffmpeg')
makedepends=('python-setuptools')
provides=('gnomecast')
source=("$pkgname::git://github.com/keredson/gnomecast.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1

	install -Dm0644 cast.png "$pkgdir/usr/share/pixmaps/gnomecast.png"

	_launcher="$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm0755 /dev/stdin "$_launcher"<<END
[Desktop Entry]
Version=$pkgver
Name=Gnomecast
Comment=Cast local files to Chromecast
Exec=python -m gnomecast
Icon=gnomecast
Type=Application
END
}


