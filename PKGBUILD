# Contributor: ShadowKyogre <shadowkyogre-ala-gmail.com>
# Maintainer: L.G. Sarmiento <lgsarmientop-ala-unal.edu.co>
pkgname=artha
pkgver=1.0.3
pkgrel=4
pkgdesc='A free cross-platform English thesaurus based on WordNet'
arch=('i686' 'x86_64')
url="http://artha.sourceforge.net/wiki/index.php/Home"
license=('GPL')
depends=('wordnet' 'gtk2' 'dbus-glib')
optdepends=('enchant: spell checking support'
  'libnotify: notification support'
  'galago-daemon: notification support'
  'aspell-en: to show suggestion with aspell in English')
options=('!emptydirs')
source=("http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('9bc69f5666a1f494e21a0a0add9ebb16')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  msg 'patching the Makefile'
  sed -i "200 s/LDFLAGS = /& -Wl,--copy-dt-needed-entries /g" src/Makefile
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
