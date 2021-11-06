# Maintainer: Mohammadreza Abdollahzadeh <morealaz[at]gmail[dot]com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Kyle <kyle@gmx.ca>

pkgname=java-atk-wrapper-openjdk-ea
pkgver=0.38.0
pkgrel=1
_jvmver=18
pkgdesc="ATK wrapper for screen reader access to Java Swing applications - OpenJDK ${_jvmver}"
url='https://gitlab.gnome.org/GNOME/java-atk-wrapper/'
arch=('x86_64')
license=('LGPL')
makedepends=('gobject-introspection' 'gnome-common' 'gtk2' 'gtk3' "java-environment=${_jvmver}" 'xorg-xprop' 'at-spi2-atk')
depends=('java-atk-wrapper-common' "java-runtime=${_jvmver}")
provides=("java-atk-wrapper-openjdk=${_jvmver}")
conflicts=("java-atk-wrapper-openjdk=${_jvmver}")
options=(!emptydirs)
source=(https://gitlab.gnome.org/GNOME/java-atk-wrapper/-/archive/${pkgver}/${pkgname%-openjdk-ea}-${pkgver}.tar.bz2)
sha256sums=('411ef463ac843beca8e96cd57a1771ca752f0c2703c569045235c3a587c60542')
sha512sums=('db0ad285c7dcc6f4a984de79af58a48cd31f0a7d8c34ec519993335a616a532c085bcd8c9ec2905499c38e95c1e9009b3bb314f3e91e4e19d7884f050bb62528')

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
# vim: ts=4 sw=4:
