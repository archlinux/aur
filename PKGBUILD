# Maintainer: Tom Wambold <tom5760@gmail.com>
pkgname=emane
pkgver=0.9.2_r1
pkgrel=1
pkgdesc="Extendable Mobile Ad-hoc Network Emulator"
arch=('i686' 'x86_64')
url="http://cs.itd.nrl.navy.mil/work/emane/index.php"
license=('BSD')
options=(!libtool)
depends=(ace libxml2 libpcap)
optdepends=('python2: Python bindings'
            'perl: Perl bindings')
makedepends=(python2 perl)
source=('http://downloads.pf.itd.nrl.navy.mil/emane/0.9.2-r1/emane-0.9.2-release-1.src.tar.gz'
        'c++11.patch')
md5sums=('bac0267c492694bd545ef833d0d1f44d'
         '668032102fee4b53315dc6bae4341bcc')

build() {
  cd "$srcdir/emane-0.9.2-release-1/src"
  bsdtar -xf emane-0.9.2.tar.gz
  cd emane-0.9.2

  patch -p1 < "$srcdir/c++11.patch"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/emane-0.9.2-release-1/src/emane-0.9.2"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
