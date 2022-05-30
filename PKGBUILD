# Maintainer: Mohammadreza Abdollahzadeh <morealaz[at]gmail[dot]com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Kyle <kyle@gmx.ca>

pkgname=java-atk-wrapper-openjdk-ea
pkgver=0.40.0
pkgrel=1
_jvmver=19
pkgdesc="ATK wrapper for screen reader access to Java Swing applications - OpenJDK ${_jvmver}"
url='https://gitlab.gnome.org/GNOME/java-atk-wrapper/'
arch=('x86_64')
license=('LGPL')
makedepends=('gobject-introspection' 'gnome-common' 'gtk2' 'gtk3' "java-environment=${_jvmver}" 'xorg-xprop' 'at-spi2-atk')
depends=('java-atk-wrapper-common' "java-runtime=${_jvmver}")
provides=("java-atk-wrapper-openjdk=${_jvmver}")
conflicts=("java-atk-wrapper-openjdk=${_jvmver}")
options=(!emptydirs)
source=("${url}/-/archive/${pkgver}/${pkgname%-openjdk-ea}-${pkgver}.tar.bz2")
sha256sums=('2456fc3cde27e185ec417ae5b64b59d34197b5ece18319c9a6eaa5f10eccaa7e')

prepare() {
	cd ${pkgname%-openjdk-ea}-${pkgver}
	autoreconf -fiv
}

build() {
	cd ${pkgname%-openjdk-ea}-${pkgver}
	export PATH="/usr/lib/jvm/java-${_jvmver}-openjdk/bin:${PATH}"
	./configure \
  		--prefix=/usr
	make
}

package() {
	cd ${pkgname%-openjdk-ea}-${pkgver}
	export PATH="/usr/lib/jvm/java-${_jvmver}-openjdk/bin:${PATH}"
	make -j1 DESTDIR="${pkgdir}" install
	rm "${pkgdir}"/usr/lib/*.so*
	rm -f "${pkgdir}"/usr/lib/jvm/java-${_jvmver}-openjdk/conf/*
}
# vim: ts=4 sw=4 et:
