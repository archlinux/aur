# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Pierre Neidhardt <ambrevar@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor:  Gour <gour@mail.inet.hr>

pkgname=emms
pkgver=6.00
pkgrel=1
pkgdesc="The Emacs Multimedia System"
url="https://www.gnu.org/software/emms/"
arch=('x86_64')
license=('GPL3')
depends=('emacs' 'taglib')
install=${pkgname}.install
validpgpkeys=('691BF9D0EEC472730726EB7869725A21D60EEC42')
source=(https://ftp.gnu.org/gnu/emms/emms-$pkgver.tar.gz{,.sig})
sha256sums=('6b05b5a6ff811d0cb1f0119b9fe831a87dd6a252994168257cd0b7bbc0dbb8da'
            'SKIP')

prepare() {
  cd $pkgname-$pkgver
  sed -i \
    -e "s|/usr/local|/usr|g" \
    -e "s|/info|/share/info|g" \
    Makefile
}

build() {
  cd $pkgname-$pkgver
  make
  make emms-print-metadata
}

package() {
  cd $pkgname-$pkgver
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/{man/man1,info}
  make DESTDIR="$pkgdir" install
}
