# Maintainer: Mario Finelli <mario at finel dot li>
# Contributor: houmain <houmain at posteo dot net>

pkgname=keymapper
pkgver=1.8.2
pkgrel=1
pkgdesc="A cross-platform context-aware keyremapper"
arch=(i686 x86_64 armv6h armv7h aarch64)
url=https://github.com/houmain/keymapper
license=(GPL3)
depends=(gcc-libs libusb libx11)
makedepends=(cmake)
source=(https://github.com/houmain/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz
        ${pkgname}d.service
        $pkgname.desktop)
sha256sums=('816040542d90a79f3f5e039952c7c23ebc81e92845baaeb418c9d349c2d0fd97'
            '1c403c317815a339cd1f9c081533b207e93464b138696a9caef9a62489a70416'
            '32797443d2b92d3b01d683563426fbea3a18e16ad965759c9ce06ea301488654')

prepare() {
  cd $pkgname-$pkgver
  echo "\"$pkgver\"" > src/_version.h
}

build() {
  cd $pkgname-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm0644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm0644 "$srcdir/${pkgname}d.service" \
    "$pkgdir/usr/lib/systemd/system/${pkgname}d.service"
}

# vim: set ts=2 sw=2 et:
