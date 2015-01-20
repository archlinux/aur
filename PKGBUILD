pkgname='gst-bt-git'
pkgver=0
pkgrel=1
pkgdesc='GStreamer plug-in which provides BitTorrent sources'
license='LGPL'
url='https://github.com/turran/gst-bt'
source=("${pkgname}::git+${url}.git")
sha1sums=('SKIP')
arch=('i686' 'x86_64' 'arm')
depends=('gstreamer' 'gst-plugins-base')
builddepends=('automake' 'autoconf')
options=('strip')
provides=('gst-bt')
conflicts=('gst-bt')

pkgver () {
	cd "${srcdir}/${pkgname}"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build () {
	cd "${srcdir}/${pkgname}"
	./autogen.sh --with-gstreamer-api=1.0 --prefix=/usr
	make PREFIX=/usr
}

package () {
	cd "${srcdir}/${pkgname}"
	install -Dm755 src/.libs/libgstbt.so.0.0.0 \
		"${pkgdir}/usr/lib/gstreamer-1.0/libgstbt.so"
}
