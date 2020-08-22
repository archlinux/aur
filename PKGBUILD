# Maintainer:
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Jacob Mischka <jacob@mischka.me>
pkgname=gnomecast-git
pkgver=1.9.9.r174.b87b597
pkgrel=1
pkgdesc="A native Linux GUI for casting local files to Chromecast devices"
arch=('any')
url="https://github.com/keredson/gnomecast"
license=('GPL3')
depends=('ffmpeg' 'gtk3' 'python-html5lib' 'python-pychromecast' 'python-bottle'
         'python-pycaption' 'python-paste' 'python-gobject' 'python-dbus')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/keredson/gnomecast.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s.r%s.%s" "$(grep '__version__ = ' gnomecast.py | head -n1 | cut -d\' -f2)" \
		"$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
