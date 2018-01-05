# $Id: PKGBUILD 275577 2017-12-22 23:06:45Z arojas $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor:  Gour <gour@mail.inet.hr>

pkgname=emms
epoch=1
pkgver=4.4
pkgrel=1
pkgdesc="The Emacs Multimedia System"
url="http://www.gnu.org/software/emms/"
arch=('x86_64')
license=('GPL3')
depends=('emacs' 'taglib')
makedepends=('git')
install=${pkgname}.install
validpgpkeys=('691BF9D0EEC472730726EB7869725A21D60EEC42')
source=(https://ftp.gnu.org/gnu/emms/emms-$pkgver.tar.gz{,.sig})
#source=(git://git.sv.gnu.org/emms.git)
sha256sums=('10ecc2e9c957ca1f80bbf8d9a0473b9eae552218aaea278dc8b10564215513ac'
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
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/{man/man1,info}
  make DESTDIR="$pkgdir" install INSTALLINFO=/usr/bin/true
}
