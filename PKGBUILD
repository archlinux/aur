# Maintainer: Firegore <admin@firegore.com>
pkgname=bloonix-plugins-basic
#_pkgname=
provides=('bloonix-plugins-basic')
pkgver=0.56
pkgrel=1
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
md5sums=('a868a010bb9aa4f17187e0a80bf6877e')
sha1sums=('77e697b2bb200b73766d63a2c7b4c81ca64fb7da')
