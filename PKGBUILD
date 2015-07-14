# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Kevin Brubeck Unhammer <unhammer@fsfe.org>
# Contributor: speps

pkgname=gimp-plugin-toy
pkgver=1.0.4
pkgrel=2
pkgdesc="GIMP plug-in that creates a toy effect or tilt-shift miniature faking on a selected layer"
url="http://registry.gimp.org/node/25803"
arch=('i686' 'x86_64')
license=('custom:MIT')
depends=('gimp')
source=("http://registry.gimp.org/files/$pkgname-$pkgver.tar.gz")
md5sums=('a46f6dbfc79445870797a87c079128d2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make LDFLAGS="-lm $LDFLAGS"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
