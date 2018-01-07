# $Id: PKGBUILD 195725 2016-11-14 15:49:29Z spupykin $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=gresolver
pkgver=0.0.5
pkgrel=10
pkgdesc="A graphical frontend for dig"
arch=('any')
license=('GPL')
url="http://jodrell.net/projects/gresolver"
depends=('gtk2-perl' 'perl-locale-gettext' 'perl-net-ipv6addr' 'ldns' 'glade-perl' 'perl-net-ipv4addr')
source=(https://arch.p5n.pp.ru/~sergej/dl/2012/gresolver-$pkgver.tar.gz
	desktop.patch
	ldns.patch)
sha256sums=('e81708843e53df51329b0f73255511d5a581a09ee9f791bd0b55b1ea67d93117'
            '70cf72d89d899ba510c486aa67bd9084f526f0037d02eac1fe624394bbebcdc4'
            'ecd52fd4a445f69313c6249943a7e903f510d7aba5040ae9f548fd5cc1dbdac6')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -p1 -i ../desktop.patch
  patch -p1 -i ../ldns.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make prefix="$pkgdir"/usr install
}
