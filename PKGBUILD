# Maintainer: Lex Black <autumn-wind at web dot de>
# Contributor: Joshua Stiefer <facedelajunk@gmail.com>
# Contributor: Arto Puranen <purcher@gmail.com>

pkgname=code-browser
pkgver=4.9
pkgrel=1
pkgdesc="folding text editor, designed to hierarchically structure any kind of text file and especially source code"
arch=(i686 x86_64)
url="http://code-browser.sourceforge.net/index.html"
license=('GPL2')
depends=('copper' 'gtk2' 'desktop-file-utils' 'hicolor-icon-theme')
depends_x86_64=('llvm')
options=(!makeflags)
install=code-browser.install
source=(http://tibleiz.net/download/code-browser-${pkgver}-src.tar.gz
        code-browser.desktop
        cb.png
        code-browser.install)
md5sums=('db60b59a6eaf94af24c832371cb03bc5'
         '05b38d1b5cd303042aaaf50714655d83'
         '153dab5bcff69701d74ee911d80d6f83'
         'cfd68c62a2b8e556bdf33bdb6af33a2f')


prepare() {
  cd "$pkgname-$pkgver"

  #sed -i "s/make/\$(MAKE)/" Makefile
  sed -i "s/-1.6//g" Makefile
}

build() {
  cd "$pkgname-$pkgver"

  if [ "$CARCH" == "x86_64" ];then
    make prefix=/usr llvm=1
  else
    make prefix=/usr OUTDIR=$srcdir/$pkgname-$pkgver
  fi
}

package() {
  cd "$pkgname-$pkgver"

  #install -dm755 ${pkgdir}/usr/bin/
  make prefix=/usr DESTDIR=${pkgdir} install

  install -D -m 644 ../code-browser.desktop ${pkgdir}/usr/share/applications/code-browser.desktop
  install -D -m 644 ../cb.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/cb.png
}

# vim:set ts=2 sw=2 et:
