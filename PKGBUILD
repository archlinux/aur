# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

pkgname=impose+
pkgver=0.2
pkgrel=5
pkgdesc='A set of utilities for manipulating DSC compliant postscript'
arch=('any')
url='http://freshmeat.net/projects/impose/'
license=('GPL')
depends=(perl)
source=(
http://ftp.de.debian.org/debian/pool/main/i/$pkgname/${pkgname}_${pkgver}.orig.tar.gz
http://ftp.de.debian.org/debian/pool/main/i/$pkgname/${pkgname}_${pkgver}-12.diff.gz
impose.1 
fixtd.1 
psbl.1 
bboxx.1
)

build() {

  cd "$srcdir/$pkgname-$pkgver" || return 1
  sed -i 's#/usr/local/bin/perl#/usr/bin/perl#' psbl fixtd || return 1

  install -dm755 ${pkgdir}/usr/bin || return 1
  for i in psbl impose fixtd bboxx; do
    install -Dm755 $i ${pkgdir}/usr/bin/ || return 1
  done

  install -dm755 ${pkgdir}/usr/share/doc/impose+ || return 1
  install -Dm644 html/* ${pkgdir}/usr/share/doc/impose+/ || return 1

  install -dm755 ${pkgdir}/usr/share/impose+ || return 1

  for i in AUTHORS README TODO; do
     install -Dm644 $i ${pkgdir}/usr/share/impose+/ || return 1
   done

   install -dm755 ${pkgdir}/usr/share/man/man1 || return 1
   install -Dm644 ../*.1 ${pkgdir}/usr/share/man/man1/ || return 1
}
md5sums=('0aed00e591065cc808d6645950f18022'
         'dcbaf0e6b414580771a7a84ea1aa7219'
         '5cb8e86f85c2f7b75131acba3535e717'
         'd25dad12ac9f3c0e39ac3904507a67e5'
         '963edbaffa48059c1b53334391a95750'
         'cfc449ca27234b802c4ee51009dbe626')
