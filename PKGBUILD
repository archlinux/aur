# Maintainer: Roman Beslik <me@beroal.in.ua>
pkgname=x11-bell-gst-git
pkgver=r2.27459b6
pkgrel=2
pkgdesc="It connects to a X11 server and plays SOUND_FILE by GStreamer when the XkbBellNotify event occurs."
arch=('i686' 'x86_64')
url="https://github.com/beroal/x11-bell-gst"
license=('BSD')
makedepends=('git')
depends=('gstreamer>=1' 'libxcb')
provides=('x11-bell-gst')
conflicts=('x11-bell-gst')
source=('git://github.com/beroal/x11-bell-gst.git')
md5sums=('SKIP')

_gitname=x11-bell-gst

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}"
	gcc $(pkg-config --cflags --libs "gstreamer-1.0 >= 1") $(pkg-config --cflags --libs "xcb-xkb >= 1") -o ${_gitname} bell.c
}

package() {
	cd "${srcdir}/${_gitname}"
	install -D -m755 ${_gitname} "${pkgdir}/usr/bin/${_gitname}"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
