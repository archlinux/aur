# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=outguess
pkgver=0.2.2
pkgrel=1
pkgdesc="A universal steganographic tool"
arch=('i686' 'x86_64')
url="http://www.outguess.org"
license=('GPL')
depends=('glibc')
#source=(http://www.outguess.org/$pkgname-$pkgver.tar.gz)
#source=("http://ftp.mirrorservice.org/sites/ftp.wiretapped.net/pub/security/steganography/outguess/outguess-$pkgver.tar.gz")
source=("$pkgname-$pkgver.tgz::https://github.com/resurrecting-open-source-projects/outguess/archive/$pkgver.tar.gz")
md5sums=('cecbed3fe3a2a61855f692ce97c1daa2')

prepare() {
    cd "$pkgname-$pkgver/jpeg-6b-steg"
    ln -s jconfig.cfg jconfig.h
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
# outguess E: Non-FHS man page (usr/man/man1/outguess.1.gz) found. Use /usr/share/man instead
}

package() {
    cd "$pkgname-$pkgver"
    #install -d "$pkgdir/usr/"{bin,man/man1}
    #make prefix="$pkgdir/usr" install

    install -Dm755 outguess "$pkgdir/usr/bin/outguess"
    install -Dm644 outguess.1 "$pkgdir/usr/share/man/man1/outguess.1"
}
