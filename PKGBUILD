# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: kevin <kevin@archlinux.org>
# Contributor: iztok pizorn <pizorn@gmail.com>

pkgname=fldiff
pkgver=1.1
pkgrel=10
pkgdesc="graphical diff program"
arch=(x86_64)
url="http://directory.fsf.org/wiki/Fldiff"
license=('GPL')
depends=('diffutils' 'fltk' 'xdg-utils')
source=("http://ftp.de.debian.org/debian/pool/main/f/fldiff/fldiff_$pkgver+0.orig.tar.gz"
	build-fix.patch)
md5sums=('12897c92106fb5d665210a2e82f5cf25'
         '4f6418cb0cbc33aca28a760738ea6f18')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -p1 <"$srcdir"/build-fix.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make BUILDROOT="$pkgdir" install install-desktop
  mv `find "$pkgdir"/ -name Development -type d` "$pkgdir"/usr/share/applications
}
