# Maintainer: Fanch
# Co-Maintainer: Mark Wagie <mark.wagie at tutanota dot com>
pkgname=x-tile-git
pkgver=3.1.r0.g2e5f3db
pkgrel=1
pkgdesc="Allows you to select a number of windows and tile them in different ways"
arch=('any')
url="https://www.giuspen.com/x-tile"
license=('GPL2')
depends=('gtk3' 'python-gobject')
makedepends=('git')
optdepends=('libappindicator-gtk3: Tray icon support')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/giuspen/x-tile.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --prefix=/usr --exec-prefix=/usr -f \
		--root="$pkgdir/" --optimize=1
}
