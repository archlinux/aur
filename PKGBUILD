# Maintainer: Firegore <admin@firegore.com>
pkgname=bloonix-plugins-basic
#_pkgname=
provides=('bloonix-plugins-basic')
pkgver=0.57
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
md5sums=('d39fd6f15f0b543c897331a0c284b4eb')
sha1sums=('82b40f70e8ade59bcb69a7355b7576bc8b6cc815')
