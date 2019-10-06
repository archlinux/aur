# Maintainer: alex19EP <aarnaarn2@gmail.com>
# Contributor: Kelly Prescott <kprescott@coolip.net>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=brltty-minimal
pkgver=6.0
pkgrel=2
pkgdesc="Braille display driver for Linux/Unix (minimal version)"
arch=(x86_64)
url="http://brltty.app"
license=(GPL LGPL)
depends=('gpm' 'icu' 'liblouis')
conflicts=('brltty')
provides=('brltty')
backup=(etc/brltty.conf)
options=('!emptydirs')
source=(https://brltty.app/archive/brltty-$pkgver.tar.xz
	brltty.service)
sha512sums=('07344fa902ad169967ca39d19b09dfea24e698011031dd63dce3eb997a4cb86622ee9427b216976b3ef60e5cbabb710a621621447c6bfa2313748fc1a1cf4b06'
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
		--disable-speech-support \
		--disable-api

	make
}

package() {
	cd "${srcdir}/brltty-${pkgver}"
	make INSTALL_ROOT="$pkgdir" install
	install -Dm644 Documents/brltty.conf "$pkgdir/etc/brltty.conf"
	install -Dm644 ../brltty.service "$pkgdir/usr/lib/systemd/system/brltty.service"
}
