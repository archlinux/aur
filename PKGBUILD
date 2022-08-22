# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: smallst <smallst@smallst.cn>
# Contributor:: LinRs <LinRs AT users.noreply.github.com>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor:: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=auctex
pkgver=13.1
pkgrel=1
pkgdesc="An extensible package for writing and formatting TeX files in Emacs"
arch=('any')
url="https://www.gnu.org/software/auctex/"
license=('GPL3')
depends=('emacs' 'ghostscript' 'texlive-core')
install=auctex.install
source=("https://ftp.gnu.org/pub/gnu/auctex/$pkgname-$pkgver.tar.gz"{,.sig})
sha256sums=('2b797e0eaf8e657aa7d4baa5a99badad683d1ffdc1b7c58ced9f2aa02eabcda8'
            'SKIP')
validpgpkeys=('70CDE487C45540307F86972BE2FD58BF20485F50') # Mosè Giordano <mose@gnu.org>

prepare() {
  cd "$pkgname-$pkgver"
  sed -i 's/as_fn_error $? "--with-texmf-dir=/echo as_fn_error $? "--with-texmf-dir=/' configure
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --localstatedir=/var --with-texmf-dir=/usr/share/texmf
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
}
