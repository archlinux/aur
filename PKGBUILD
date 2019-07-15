# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Gerhard Brauer <gerhard.brauer@web.de>
# Contributor: Aitor <aitor.iturri@gmail.com>

pkgname=libcdk
_pkgver=5.0-20190303
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc='Curses Development Kit - widget library, enhanced version'
arch=('x86_64' 'i686')
url='http://invisible-island.net/cdk/'
license=('BSD')
options=('!emptydirs')
source=("${pkgname}.${pkgver}.tar.gz::ftp://ftp.invisible-island.net/cdk/cdk-${_pkgver}.tgz")
sha256sums=('adad7870988d44b95df57722ab8dffc587d035183eb6b12a9500ebed4d8dba25')

build() {
  cd "cdk-${_pkgver}"

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "cdk-${_pkgver}"

  make DOCUMENT_DIR="$pkgdir/usr/share/doc/cdk" DESTDIR="$pkgdir" install \
    installCDKSHLibrary
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
