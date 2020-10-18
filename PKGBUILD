# Maintainer: Mushroom King
# Contributer: JP-Ellis <josh@jpellis>
# Contributor: <darkfeline@felesatra.moe>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>
# Contributor: Michael Fellinger <m.fellinger@gmail.com>
# Contributor: nixi <nixi at cock dot li>

pkgname=sqlitebrowser-cipher
pkgver=3.12.0
pkgrel=1
pkgdesc="SQLite Database browser is a light GUI editor for SQLite databases, built on top of Qt (with sqlcipher support)"
arch=('i686' 'x86_64')
url="http://sqlitebrowser.org/"
license=('GPL')
provides=('sqlitebrowser')
conflicts=('sqlitebrowser')
depends=('qt5-base' 'hicolor-icon-theme' 'sqlcipher' 'qt5-tools')
makedepends=('cmake')
install=sqlitebrowser.install
source=("https://github.com/sqlitebrowser/sqlitebrowser/archive/v${pkgver}.tar.gz")
sha256sums=('3f1a1453ed0f4b5b72b0468bf8ee56887eb23d71c2518a449f4eb179471d73d1')

build() {
  mkdir -p build
  cd build
  cmake -Dsqlcipher=1 ../sqlitebrowser-$pkgver
  make
}

package() {
  cd $srcdir/build
  make install DESTDIR=$pkgdir

  install -Dm0644 "$srcdir/sqlitebrowser-$pkgver/distri/sqlitebrowser.desktop" "$pkgdir/usr/share/applications/sqlitebrowser.desktop"
  install -dm0755 "$pkgdir/usr/share/icons/"
  install -m0644 "$srcdir/sqlitebrowser-$pkgver/images/logo.svg" "$pkgdir/usr/share/icons/sqlitebrowser.svg"
}