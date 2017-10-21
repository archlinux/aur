# Contributor: Ivy Foster <joyfulgirl@archlinux.us>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Heeru Kiyura <M8R-p9i5nh@mailinator.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=conkeror-git
pkgver=1.0.3.r20.g02cb4db
pkgrel=1
pkgdesc='A keyboard-oriented, highly-customizable, highly-extensible web browser based on Mozilla XULRunner.'
arch=('i686' 'x86_64')
url='http://conkeror.mozdev.org/'
license=('MPL' 'GPL' 'LGPL')
depends=('firefox')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
changelog='Changelog'
source=("$pkgname::git+http://repo.or.cz/conkeror.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed 's:-\(.*\)-:.r\1.:'
}

build() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  mkdir -p "$pkgdir/usr/share/licenses/${pkgname%-*}"
  mv "$pkgdir/usr/share/doc/conkeror/COPYING" \
     "$pkgdir/usr/share/licenses/${pkgname%-*}/COPYING"
}

