# Maintainer: M0Rf30

pkgname=coova-chilli-arch
pkgver=1.3.2
pkgrel=1
pkgdesc='an open-source software access controller'
arch=('i686' 'x86_64')
url="https://coova.github.io/"
license=('GPL')
depends=('curl' 'libpcap' 'openssl')
makedepends=('gengetopt')
optdepends=('python2')
options=(!libtool)
replaces=(coova-chilli)
source=("https://github.com/coova/coova-chilli/archive/$pkgver.tar.gz"
	chilli.service)
backup=('etc/chilli.conf')

build() {
    cd "${srcdir}/coova-chilli-${pkgver}"

    ./bootstrap   
    ./configure --prefix=/usr --sbindir=/usr/bin/ \
	--sysconfdir=/etc --localstatedir=/var \
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
}

md5sums=('26e02689f632ad27ad599bc0d9f5ae3d'
         'b416def2a56b69f0e5c3b5b09703cda9')
