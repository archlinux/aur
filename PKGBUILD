# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=colorhug-client
pkgver=0.2.7
pkgrel=2
pkgdesc="Calibration client for the Hughski ColorHug device"
arch=('i686' 'x86_64')
url="http://www.hughski.com/"
license=('GPL')
groups=()
depends=('bash-completion>=2.0' 'glib2>=2.31.10' 'libgusb>=0.2.2' 'gtk3>=3.11.2' 'colord>=1.2.9'
'colord-gtk>=0.1.24' 'libsoup>=2.4' 'libcanberra>=0.10' 'itstool' 'gnome-common'
'perl-xml-libxml' 'intltool>=0.50' 'argyllcms')
makedepends=('pkg-config' 'intltool' 'docbook2x' 'perl-xml-sax-expat')
provides=('colorhug-client')
install=colorhug-client.install
source=(http://people.freedesktop.org/~hughsient/releases/$pkgname-$pkgver.tar.xz
$pkgname-$pkgver-man.patch)
md5sums=('9304f47fd079a411fbc0294d67a139e4'
         '6b67bc461c3f48c3721a0a463ff7ad5b')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/$pkgname-$pkgver-man.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
