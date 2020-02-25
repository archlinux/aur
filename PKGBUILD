# Contributor: LinRs <LinRs AT users.noreply.github.com>
# Contributor: Eric Bélanger <eric@archlinux.org>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=auctex
pkgver=12.2
pkgrel=1
pkgdesc="An extensible package for writing and formatting TeX files in Emacs"
arch=('any')
url="https://www.gnu.org/software/auctex/"
license=('GPL3')
depends=('emacs' 'ghostscript' 'texlive-core')
install=auctex.install
source=("https://ftp.gnu.org/pub/gnu/auctex/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('59677958aa76c7a15cf62f098524f79b1cdb74d24bcdf36448ecbb5911d07893'
            'SKIP')
validpgpkeys=('70CDE487C45540307F86972BE2FD58BF20485F50') #Mosè Giordano <mose@gnu.org>

prepare() {
  cd ${pkgname}-${pkgver}
  sed -i 's/as_fn_error $? "--with-texmf-dir=/echo as_fn_error $? "--with-texmf-dir=/' configure
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --localstatedir=/var --with-texmf-dir=/usr/share/texmf
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}
