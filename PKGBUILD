# Maintainer: erik-pro <aarnaarn2@gmail.com>
# Contributor: Kelly Prescott <kprescott@coolip.net>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=brltty-minimal
pkgver=5.6
pkgrel=3
pkgdesc="Braille display driver for Linux/Unix"
arch=(x86_64)
url="http://brltty.com"
license=(GPL LGPL)
depends=('gpm' 'icu' 'liblouis')
conflicts=('brltty')
provides=('brltty')
backup=(etc/brltty.conf)
options=('!emptydirs')
source=(http://brltty.com/archive/brltty-$pkgver.tar.xz
	brltty.service)
sha512sums=('c5df33bc51f3bafb56e4627290a801937bc57b6e2de5765c04e45c4ef1229ab864f2756916500ca4ca43b79354d7a9d3d4bfb588aa9fc494ea570eab25a389c0'
	'5da854db7612b7fcc1f1a8da0825e19509158041ceedbefc7649d220fd94a17c11044985abfc435b65a8b795c19dd2d16ff05f59641e57805f710b76570a5af4')

build() {
	cd "${srcdir}/brltty-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
		--mandir=/usr/share/man \
		--with-tables-directory=/usr/share/brltty \
		--with-screen-driver=lx \
		--without-bluetooth-package \
		--enable-gpm \
		--disable-java-bindings \
		--disable-python-bindings \
		--disable-tcl-bindings \
		--disable-ocaml-bindings \
		--disable-x \
		--disable-lisp-bindings \
		--disable-polkit \
		--disable-standalone-programs \
		--disable-fm-support \
		--disable-speech-support \
		--disable-midi-support \
		--disable-api

	make
}

package() {
	cd "${srcdir}/brltty-${pkgver}"
	make INSTALL_ROOT="$pkgdir" install
	install -Dm644 Documents/brltty.conf "$pkgdir/etc/brltty.conf"
	install -Dm644 ../brltty.service "$pkgdir/usr/lib/systemd/system/brltty.service"
}
