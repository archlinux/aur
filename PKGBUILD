# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=foobnix-git
pkgver=3.1.r113.8ce2d8c2
pkgrel=1
pkgdesc="Music player for Linux"
arch=('i686' 'x86_64')
url="http://www.foobnix.com"
license=('GPL3')
depends=('python2-chardet' 'python2-cairo' 'python2-simplejson' 'python2-mutagen'
		'gst-plugins-good' 'gst-plugins-base' 'gst-python2' 'webkitgtk' 'libkeybinder3' 'gettext'
		'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav' 'fuseiso' 'python2-notify' 'lame' 'faac'
		'python2-keybinder2' 'ffmpeg' 'python2-dbus')
makedepends=('python2-distutils-extra')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/foobnix/foobnix')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python2 setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python2 setup.py install --root="$pkgdir/" --optimize=1
}
