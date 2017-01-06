# Maintainer: Firegore <admin@firegore.com>
pkgname=bloonix-plugins-basic
#_pkgname=
provides=('bloonix-plugins-basic')
pkgver=0.60
pkgrel=2
pkgdesc='Bloonix Monitoring Basic Plugins'
arch=('i686' 'x86_64')
url='https://bloonix.org'
license=('GPLv3')
options=('!emptydirs')

depends=('perl-authen-sasl' 'perl-net-smtp-ssl' 'perl-net-dns' 'bloonix-core' 'curl')
source=(https://download.bloonix.de/sources/$pkgname-$pkgver.tar.gz)

build() {
    cd "$srcdir"/$pkgname-$pkgver
    #perl Configure.PL
    perl Configure.PL --prefix /usr 
    make
}

package() {
	cd "$srcdir"/$pkgname-$pkgver
    make DESTDIR="$pkgdir" install

    mkdir $pkgdir/etc
    mkdir -p $pkgdir/etc/bloonix/agent/conf.d
    chmod 750 $pkgdir/usr/lib/bloonix/etc/sudoers.d
    cp $pkgdir/usr/lib/bloonix/etc/sudoers.d $pkgdir/etc -r
    cp $pkgdir/usr/lib/bloonix/etc/conf.d/* $pkgdir/etc/bloonix/agent/conf.d -r

}

# vim:set ts=2 sw=2 et:
md5sums=('3ba8654bc6692c47ef3d96642e6cc272')
sha1sums=('c0907dbd0e0ccfcbfcbbfc3188f178ace9b02d26')
