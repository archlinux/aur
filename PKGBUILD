# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Eric Forgeot < http://ifiction.free.fr >

pkgname=rolldice
pkgver=1.10
pkgrel=6
pkgdesc="A virtual dice roller"
arch=(i686 x86_64)
url="http://packages.debian.org/source/sid/rolldice"
license=('GPL2')
depends=('glibc')
source=(http://ftp.de.debian.org/debian/pool/main/r/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz rolldice.6)
md5sums=('c65d37f81e80d0d5db6c49c08cf3b484' 'a4e0c4c28528b495690af2771daeb7b8')

prepare () {

    cd $srcdir/$pkgname-${pkgver}.orig

    sed -i -e 's:/usr/games:/usr/bin:g' Makefile

}

build () {

  cd $srcdir/$pkgname-${pkgver}.orig

  make 

}

package () {

    cd $srcdir/$pkgname-${pkgver}.orig

    make DESTDIR=$pkgdir install 

    ls -R $srcdir

    install -Dm 644 $srcdir/${pkgname}.6 $pkgdir/usr/share/man/fr/man6/${pkgname}.6

    install -d $pkgdir/usr/share/doc/$pkgname 

    for files in Changelog COPYING CREDITS README 
    do
	install -m 644 -t $pkgdir/usr/share/doc/$pkgname $files

    done

}
