# Maintainer: Abraham Levine <arc at plusreed dot com>
pkgname=pa-applet-git
pkgver=17.33b413b
pkgrel=1
pkgdesc="PulseAudio control applet"
arch=(i686 x86_64)
url="https://github.com/fernandotcl/pa-applet"
license=('BSD')
depends=('gtk3' 'libnotify' 'libpulse')
makedepends=('git')
options=('!libtool')

source=("$pkgname"::'git://github.com/fernandotcl/pa-applet.git')
md5sums=('SKIP')

pkgver() {
	    cd "$pkgname"
	        echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "$srcdir/$pkgname"
	CFLAGS+=" -Wno-error"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
