# Maintainer: aksr <aksr at t-com dot me>
pkgname=ee-editor
_pkgname=ee
pkgver=1.5.2
pkgrel=4
_realname='easyedit'
pkgdesc='EasyEdit, a classic curses text editor. Born in HP-UX, used in FreeBSD.'
arch=('i686' 'x86_64')
url='http://www.users.qwest.net/~hmahon/'
license=('BSD')
depends=(ncurses)
makedepends=()
backup=()
source=("http://web.archive.org/web/20120716042037/http://mahon.cwx.net/sources/$_pkgname-$pkgver.src.tgz"
        'BSD-2_clause')
md5sums=('6e32713121f54cd021abf9b6e726a7b5'
         '99184c6b857f9d2d49046d2b896f1692')
sha1sums=('da0697f34e407c010754922531b2f94bd7a589f8'
          '14719494c1780f00bd2017bfced9ad73e6f26639')
sha256sums=('e08d7511a48b43ee354042fe3fe7d9cb3431238caedcf4ac729c61a447003918'
            '5b2531f7c9363e2bc2212cc8e20f321793319bf564353b20a189b852a0e562cb')

prepare() {
  cd "$srcdir/$_realname-$pkgver"
  sed -i '555s/SIGUNUSED/24/' ee.c
}

build() {
  cd "$srcdir/$_realname-$pkgver"
  ./create.make
  make -f make.local curses
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  mkdir -p $pkgdir/usr/{bin,share/{man/man1,licenses/$pkgname}}
  install -sm755 ee $pkgdir/usr/bin
  install -m755  ee.1 $pkgdir/usr/share/man/man1
  install -m644 "$srcdir/BSD-2_clause" $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

