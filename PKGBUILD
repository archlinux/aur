# Maintainer: Firegore <admin@firegore.com>
pkgname=bloonix-plugins-linux
#_pkgname=
provides=('bloonix-plugins-linux')
pkgver=0.64
pkgrel=1
pkgdesc='Bloonix Monitoring Linux Plugins'
arch=('i686' 'x86_64')
url='https://bloonix.org'
license=('GPLv3')
options=('!emptydirs')

depends=('bloonix-core')
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
md5sums=('2255aec9ccd96630b3f5931168d8a9a1')
sha1sums=('bbbaad3aaee16236f3febdf3ffa1e5b74fb0a858')
