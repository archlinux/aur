# Maintainer:
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Adam 'battlemidget' Stokes <adam.stokes@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
pkgname=eterm
pkgver=0.9.6
pkgrel=1
pkgdesc="A vt102 terminal emulator intended as a replacement for xterm."
arch=('i686' 'x86_64')
url="http://www.eterm.org/"
license=('custom')
depends=('freetype2>=2.3.5' 'libast>=0.7' 'libxmu' 'libxres')
options=('!libtool')
source=(http://www.eterm.org/download/Eterm-${pkgver}.tar.gz)
md5sums=('90e424584c22d4050496874d14f78bb1')

build() {
	cd ${srcdir}/Eterm-${pkgver}
	CONF=""
	[ "${CARCH}" = "x86_64" ] && CONF="--disable-mmx"
	./configure --prefix=/usr --mandir=/usr/share/man \
	    --enable-trans --enable-utmp \
        --enable-multi-charset=utf-8 \
	    --enable-xim --with-theme-update \
	    --with-backspace=bs --without-terminfo \
	    --enable-multi-charset ${CONF}
	make || return 1
}

package() {
	cd ${srcdir}/Eterm-${pkgver}
	make DESTDIR=${pkgdir} install

	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

