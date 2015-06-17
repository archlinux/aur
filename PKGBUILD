# Maintainer: M0Rf30

pkgname=coova-chilli-arch
pkgver=1.3.0
pkgrel=1
pkgdesc='an open-source software access controller'
arch=('i686' 'x86_64')
url="http://coova.org/CoovaChilli"
license=('GPL')
depends=('curl' 'libpcap' 'openssl')
optdepends=('python2')
options=(!libtool)
replaces=(coova-chilli)
source=(http://ap.coova.org/chilli/coova-chilli-${pkgver}.tar.gz
coova-chilli)
backup=('etc/chilli.conf')

build() {
    cd "${srcdir}/coova-chilli-${pkgver}"

    export CFLAGS="-Wno-error=unused-but-set-variable"
   
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
        --enable-statusfile \
        --disable-static \
        --enable-shared \
	--enable-largelimits \
	--enable-miniportal \
	--enable-chilliredir \
	--enable-chilliproxy \
        --enable-chilliscript \
	--with-poll \
	--with-openssl \
	--enable-chilliradsec 
    make
}

package() {
    cd "${srcdir}/coova-chilli-${pkgver}"
    make DESTDIR="${pkgdir}" install
    rm -rf ${pkgdir}/etc/init.d
    install -D $srcdir/coova-chilli $pkgdir/etc/rc.d/coova-chilli
    chmod +x $pkgdir/etc/rc.d/coova-chilli
}

md5sums=('dc0037e3cdebcb60508081b4e42e984a'
         'b416def2a56b69f0e5c3b5b09703cda9')
