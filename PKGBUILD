# Maintainer: Alexej Magura <sickhadas.nix*gmail*>
# Contributor: Eric Forgeot < http://ifiction.free.fr >

pkgname=rolldice
pkgver=1.16
pkgrel=1
pkgdesc="A virtual dice roller"
arch=(i686 x86_64)
url="http://packages.debian.org/source/sid/rolldice"
license=('GPL2')
depends=('readline')
source=("http://http.debian.net/debian/pool/main/r/rolldice/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('d2456d2411321167aeb0285bdd458e15')
#source=(http://ftp.de.debian.org/debian/pool/main/r/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz rolldice.6)
#mmaked5sums=('c65d37f81e80d0d5db6c49c08cf3b484' 'a4e0c4c28528b495690af2771daeb7b8')

prepare () {

    cd "$srcdir"/"$pkgname-$pkgver"

    sed -i -e 's:/usr/games:/usr/bin:g' Makefile
    sed -i 's#\(.TH ROLLDICE \)6#\11#' rolldice.6.src
    sed -i 's#\(rolldice.\)6.gz#\11.gz#g' Makefile

}

build () {

  cd "$srcdir"/"$pkgname-$pkgver"

  make

}

package () {

    cd "$srcdir"/"$pkgname-$pkgver"

    make DESTDIR="\"$pkgdir\"" MAN="\"$pkgdir\"/usr/share/man/man1" install


    install -d "$pkgdir"/usr/share/doc/"$pkgname"

    install -m644 -t "$pkgdir"/usr/share/doc/"$pkgname" \
	    Changelog CREDITS COPYING README

}
