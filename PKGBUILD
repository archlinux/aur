# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: Alexej Magura <agm2819*gmail*>

pkgname=freebsd-manpages
pkgver=11.0
pkgrel=1
pkgdesc="Manual pages for GNU/kFreeBSD systems"
arch=('any')
url="http://packages.debian.org/sid/freebsd-manpages"
license=('BSD')
#depends=('')
makedepends=('deb2targz')
source=("http://mirrors.kernel.org/debian/pool/main/f/$pkgname/${pkgname}_${pkgver}-${pkgrel}_all.deb")
md5sums=('7ef8c3f06b068461953d6d71d0f226a8')


prepare () {

    cd "$srcdir"

    deb2targz "${pkgname}_${pkgver}-${pkgrel}_all.deb"

    [[ -d "$pkgname-$pkgver" ]] && rm -r "$pkgname-$pkgver"

    ! [[ -d "$pkgname-$pkgver" ]] && mkdir "$pkgname-$pkgver"

    tar -C "$pkgname-$pkgver" -xJf "${pkgname}_${pkgver}-${pkgrel}_all.tar.xz"

}

package () {

    cd "$srcdir/$pkgname-$pkgver"

    install -d "$pkgdir"/usr/share{/man{/man2,/man3,/man4,/man9},/licenses/$pkgname}

    for files in $(ls -1 $srcdir/$pkgname-$pkgver/usr/share/man/man2)
    do
	install -m 644 -t "$pkgdir"/usr/share/man/man2 usr/share/man/man2/$files
    done 

    for files in $(ls -1 $srcdir/$pkgname-$pkgver/usr/share/man/man3)
    do
	install -m 644 -t "$pkgdir"/usr/share/man/man3 usr/share/man/man3/$files
    done

    for files in $(ls -1 $srcdir/$pkgname-$pkgver/usr/share/man/man4)
    do
	install -m 644 -t "$pkgdir"/usr/share/man/man4 usr/share/man/man4/$files
    done

    for files in $(ls -1 $srcdir/$pkgname-$pkgver/usr/share/man/man9)
    do
	install -m 644 -t "$pkgdir"/usr/share/man/man9 usr/share/man/man9/$files
    done

    install -m 644 -t "$pkgdir"/usr/share/licenses/$pkgname usr/share/doc/$pkgname/copyright

}
