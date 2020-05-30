# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=guiscrcpy
pkgver=3.9.2
pkgrel=1
pkgdesc="Open Source GUI based Android Screen Mirroring System"
arch=('any')
url="https://guiscrcpy.github.io"
license=('GPL3')
depends=('scrcpy' 'python-pyqt5' 'python-pynput' 'python-fonttools'
         'python-psutil' 'python-cairosvg')
makedepends=('git' 'python-setuptools')
optdepends=('usbaudio: AOA audio, deprecated since Android 8.0')
source=("git+https://github.com/srevinsaju/guiscrcpy.git#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's/==/>=/g' requirements.txt
}

build() {
	cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
	cd "$srcdir/$pkgname"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

	install -Dm644 "appimage/$pkgname.desktop" -t \
		"$pkgdir/usr/share/applications"
	install -Dm644 "appimage/$pkgname.png" -t \
		"$pkgdir/usr/share/pixmaps"
}
