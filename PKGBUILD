# Maintainer: zocker_160 <zocker1600 at posteo dot net>
# Contributor: Brian Schubert <bewschubert@gmail.com>

pkgname=ifm-git
_pkgname=ifm
pkgver=5.5
pkgrel=1
pkgdesc="A language and a program for keeping track of your progress through an Interactive Fiction game."
arch=('i686' 'x86_64')
url="https://ifm.readthedocs.io/en/latest/intro.html"
license=('GPL2')
depends=('tk' 'perl')
makedepends=('tk' 'help2man')
conflicts=('ifm')
source=(https://github.com/zocker-160/ifm/archive/v$pkgver.tar.gz)
sha256sums=('eb7a038864fad62ccc4cfe8f5f12aac233f5602fdb3957e8070a27b937718b3e')
options=('docs')

build() {
    cd $srcdir/$_pkgname-$pkgver

    chmod +x ./autogen.sh
    ./autogen.sh

    export CPPFLAGS=-D_GNU_SOURCE
    ./configure --prefix=/usr --mandir=/usr/share/man
    make
}

package() {
    cd $srcdir/$_pkgname-$pkgver
    make DESTDIR=$pkgdir docdir=$pkgdir/usr/share/doc install
}
