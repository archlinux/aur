# Maintainer: Paul Hentschel <aur at hpminc dot com>

pkgname=cmoc
pkgver=0.1.101
pkgrel=1
pkgdesc="6809-generating cross-compiler for a subset of the C language."
arch=('x86_64')
url="http://gvlsywt.cluster051.hosting.ovh.net/dev/cmoc.html"
license=('GPL3')
depends=('perl' 'lwtools')
makedepends=('discount')
source=("http://gvlsywt.cluster051.hosting.ovh.net/dev/$pkgname-$pkgver.tar.gz")

sha256sums=('cfd8cead5c57c4bada35a9f1e74fe914a0f41633dec7fcc6ca7dcc54adc43fd3')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make && make html
}

check() {
  cd "$pkgname-$pkgver"
  make -k check -j1
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # Install html documentation
  install -m644 doc/cmoc-{implementation,manual,vectrex}.html "$pkgdir/usr/share/doc/$pkgname"
}

# vim:set ts=2 sw=2 et:
