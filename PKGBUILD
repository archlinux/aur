# Maintainer: danieltetraquark
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: ngukho <ngukho at gmail dot com>
pkgname=liblbfgs
pkgver=1.10
pkgrel=2
pkgdesc="A C port of the implementation of Limited-memory Broyden-Fletcher-Goldfarb-Shanno (L-BFGS) method written by Jorge Nocedal."
arch=('i686' 'x86_64')
url="http://www.chokkan.org/software/liblbfgs/"
makedepends=('autoconf-archive' 'libtool')
license=('custom:MIT')
source=("https://github.com/chokkan/liblbfgs/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('2b08dc5d4fdd737575f58983fa7b6c143bc12edaca47b7aeadf221afe6e573fa4a53423f323f569aa93c9dbeafb9b80a6d2f755fec6da04e6b7221f0a67816f8')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # note: Original tar gz contained the generated files for ./configure, but it is only available from webarchive, so we can simply regenerate them.
  # URL for historical tar gz file https://web.archive.org/web/20140815101758if_/https://cloud.github.com/downloads/chokkan/liblbfgs/liblbfgs-1.10.tar.gz
  autoupdate
  libtoolize --force
  aclocal
  autoheader
  automake --force-missing --add-missing
  autoconf
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install

  install -D -m644 COPYING ${pkgdir}/usr/share/licenses/liblbfgs/COPYING
}

# vim:set ts=2 sw=2 et:
