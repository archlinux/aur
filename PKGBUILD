# Maintainer: Mike Sampson <mike at sambodata dot com>
# Contributor: Brian Schubert <bewschubert@gmail.com>

pkgname=ifm
pkgver=5.4
pkgrel=1
pkgdesc="A language and a program for keeping track of your progress through an Interactive Fiction game."
arch=('i686' 'x86_64')
url="http://fluffybunny.memebot.com/ifm.html"
license=('GPL')
depends=('tk' 'perl')
makedepends=('tk')
source=(http://mirror.ifarchive.org/if-archive/mapping-tools/$pkgname-$pkgver.tar.gz)
md5sums=('fa18a544fc0fec2ddc452777317357ea')
options=('docs')

build() {
    cd $srcdir/$pkgname-$pkgver

    sed s:/usr/local/doc:/usr/share/doc: -i man/ifm.1

    export CPPFLAGS=-D_GNU_SOURCE
    ./configure --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir docdir=$pkgdir/usr/share/doc install
}
