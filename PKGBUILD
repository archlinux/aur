# Contributor: ConnorBehan <connor.behan@gmail.com>

pkgname=unified-demos
pkgver=0.3
pkgrel=4
pkgdesc="Replacement for all gtk-demo language bindings"
arch=(i686 x86_64)
url="http://demohack.sourceforge.net/"
license=('LGPL')
depends=('pygtk' 'medit-full>=1.1.0')
makedepends=('pkg-config' 'gtkmm')
optdepends=('gtkmm:	Running C++ demos'
	    'gtk2-perl:	Running Perl demos'
	    'ruby-gtk2:	Running Ruby demos')
source=(https://downloads.sourceforge.net/sourceforge/demohack/$pkgname-$pkgver.tar.gz)

build() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -i -e 's|env python|env python2|' demohack
  for file in `ls data/demos/pygtk/bin`; do
  	sed -i -e 's/env python/env python2/' data/demos/pygtk/bin/$file
  done
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

md5sums=('2314284ac392f29fa17e265748dcb737')
