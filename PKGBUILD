# Maintainer: Daniel Sandman <revoltism@gmail.com>

pkgname=quirky-git
pkgver=r186.dc3e522
pkgrel=2
pkgdesc="Destined to be a real IRC client for both light and heavyweight IRC users."
arch=('i686' 'x86_64')
url="https://github.com/evolve-os/quirky"
license=('GPL2')
depends=('vala' 'gtk3' 'glib2' 'pango' 'cairo' 'gdk-pixbuf2')
makedepends=('git' 'autoconf')
conflicts=('quirky')
provides=('quirky')
source=("$pkgname::git+https://github.com/evolve-os/quirky.git#branch=master")
md5sums=('SKIP')

pkgver() {
     cd "$srcdir/$pkgname"
	 echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
     cd "$srcdir/$pkgname"
     autoreconf -vfi
     ./configure --prefix=/usr 
     make
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 src/quirky "$pkgdir/usr/bin/quirky"
     	install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
     	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
