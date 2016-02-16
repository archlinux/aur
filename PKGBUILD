# Maintainer: Michael Egger <gcarq@archlinux.info>
pkgname=indicator-multiload
pkgver=0.4
pkgrel=3
pkgdesc="A System Load indicator for GTK 3."
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-multiload"
license=('GPL')
depends=('gtk3' 'gnome-common' 'libindicator-gtk3' 'libappindicator-gtk3' 'libgtop')
makedepends=('gcc' 'make')
options=('strip')
install=indicator-multiload.install
source=("https://launchpad.net/$pkgname/stable/$pkgver/+download/$pkgname-$pkgver.tar.gz")
md5sums=('10c1b5ad2f6b6f833b4ecdcdf17ee675')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --libexecdir=/usr/lib/$pkgname \
              --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "data/de.mh21.indicator-multiload.gschema.xml" "$pkgdir/usr/share/glib-2.0/schemas/de.mh21.indicator-multiload.gschema.xml"
}
