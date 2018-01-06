# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: tardo <tardo@nagi-fanboi.net>
# Contributor: Simon Morgan <"mra84964@mra.pb.hx".decode('rot-13')>

pkgname=ht
pkgver=2.1.0
pkgrel=5
pkgdesc="A file editor/viewer/analyzer for executables"
arch=('x86_64')
url="http://hte.sourceforge.net/"
license=('GPL')
depends=('gcc-libs' 'ncurses' 'lzo')
makedepends=('texinfo')
source=(http://downloads.sourceforge.net/sourceforge/hte/$pkgname-$pkgver.tar.bz2)
md5sums=('09b2a4461d75e9cd03af1cd67fadc1ec')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  ./configure --disable-x11-textmode --enable-release --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  # avoid TeX conflict
  mv "$pkgdir"/usr/bin/ht "$pkgdir"/usr/bin/hte
  # doc
  install -dm0755 "$pkgdir"/usr/share/{info,doc/ht}
  install -m0644 doc/*.info "$pkgdir"/usr/share/info/
  install -m0644 doc/{README,*.html} "$pkgdir"/usr/share/doc/ht/
}
