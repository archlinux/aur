# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Neil Lin <neil@vip.url.com.tw>
# Contributor: OramahMaalhur <oramahmaalhur@gmail.com>

pkgname=stardict-reduced
pkgver=3.0.6
pkgrel=1
pkgdesc='International dictionary software - very reduced version with offline dictionaries support only'
arch=('i686' 'x86_64')
url='http://www.stardict.org/'
license=('GPL')
depends=('gtk2' 'libsigc++' 'libsm')
makedepends=('intltool' 'popt' 'gnome-doc-utils' 'gnome-common')
#makedepends=('intltool' 'popt' 'gnome-doc-utils' 'gnome-common' 'libmariadbclient' 'enchant' 'gtk2' 'libsigc++' 'libsm' 'espeak' 'libgnome')
options=('!libtool' '!emptydirs')
conflicts=('stardict' 'stardict-lite')
provides=("stardict=$pkgver")
source=("http://downloads.sourceforge.net/project/stardict-4/$pkgver/stardict-$pkgver.tar.bz2"
        'gcc46.patch'
        'glib2.patch')
md5sums=('93371b35482e6380e8bd4ba5d256b864'
         '52ff47441c503de07add4b7688510bc5'
         'b2f216897c9053c7e4666c3d78705cf1')

build() {
	cd "${srcdir}/stardict-${pkgver}"

	patch -p1 -i ../gcc46.patch
	patch -p1 -i ../glib2.patch
    ./autogen.sh
	./configure \
		PKG_CONFIG=/usr/bin/pkg-config \
		--prefix=/usr \
		--sysconfdir=/etc \
		--mandir=/usr/share/man \
		--disable-schemas-install \
        --disable-qqwry \
		--disable-espeak \
		--disable-gucharmap \
		--disable-festival \
		--disable-updateinfo \
        --disable-dictdotcn \
        --disable-qqwry \
        --disable-advertisement \
        --disable-spell \
        --disable-wordnet \
        --disable-man \
        --disable-tools \
        --disable-htmlparse \
        --disable-xfdfparse \
        --disable-powerwordparse \
        --disable-wikiparse \
        --disable-gtk-doc \
        --disable-scrollkeeper \
        --disable-deprecations
        #--disable-gnome-support
        #--disable-darwin-support \
        #--disable-maemo-support \
        #--disable-gpe-support

	make
}

package() {
	cd "${srcdir}/stardict-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
