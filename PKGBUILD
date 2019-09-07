# Maintainer: Mikhail Rudenko <mike.rudenko@gmail.com>
pkgname=qt-autoupdater
pkgver=2.1.5_4
pkgrel=1
pkgdesc="A Qt library to automatically check for updates and install them"
arch=('x86_64')
url="https://skycoder42.github.io/QtAutoUpdater/"
license=('BSD')
depends=('qt5-base')
makedepends=('qdep' 'perl')
source=(https://github.com/Skycoder42/QtAutoUpdater/archive/${pkgver//_/-}.tar.gz)
md5sums=('295433fc74597d539de845f3685a5258')

build() {
  cd "$srcdir/QtAutoUpdater-${pkgver//_/-}"
  qmake
  perl -w /usr/bin/syncqt.pl -module QtAutoUpdaterCore -version 2.1.5 -outdir . -builddir . .
  perl -w /usr/bin/syncqt.pl -module QtAutoUpdaterGui -version 2.1.5 -outdir . -builddir . .
  make
}

package() {
  cd "$srcdir/QtAutoUpdater-${pkgver//_/-}"
  make INSTALL_ROOT="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

# vim:set ts=2 sw=2 et:
