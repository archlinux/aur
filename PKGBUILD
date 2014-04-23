# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Jeremy <reebydobalina@yahoo.ca>

pkgname=ruby-cairo
pkgver=1.12.9
pkgrel=1
pkgdesc='Ruby bindings for cairo'
arch=('x86_64' 'i686')
url='http://cairographics.org/rcairo/'
license=('GPL')
depends=('ruby' 'cairo')
makedepends=('ruby-pkgconfig')
source=("http://cairographics.org/releases/rcairo-$pkgver.tar.gz")
sha256sums=('ef894e2a52926c1c9d6d7f32cc1899fa21de90787a4a98493e4a004ecdb90b6e')

build() {
  cd "$srcdir/rcairo-$pkgver"

  ruby extconf.rb --vendor
  make
}

package() {
  cd "$srcdir/rcairo-$pkgver"

  make -j1 DESTDIR="$pkgdir" install # Workaround installation failure with -j1
  install -Dm644 ext/cairo/cairo.so \
    "$pkgdir/usr/lib/ruby/vendor_ruby/2.1.0/$CARCH-linux/cairo.so"
}

# vim:set ts=2 sw=2 et:
