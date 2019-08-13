# Maintainer: Mushroom King
# Contributer: JP-Ellis <josh@jpellis>
# Contributor: <darkfeline@felesatra.moe>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>
# Contributor: Michael Fellinger <m.fellinger@gmail.com>
# Contributor: nixi <nixi at cock dot li>

pkgname=sqlitebrowser-cipher
pkgver=3.11.2
pkgrel=1
pkgdesc="SQLite Database browser is a light GUI editor for SQLite databases, built on top of Qt (with sqlcipher support)"
arch=('i686' 'x86_64')
url="http://sqlitebrowser.org/"
license=('GPL')
provides=('sqlitebrowser')
conflicts=('sqlitebrowser')
depends=('qt5-base' 'hicolor-icon-theme' 'sqlcipher')
makedepends=('cmake')
install=sqlitebrowser.install
source=("https://github.com/sqlitebrowser/sqlitebrowser/archive/v${pkgver}.tar.gz")
sha256sums=('298acb28878aa712277a1c35c185b07a5a1671cc3e2c6a21b323477b91d486fc')

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
  install -m0644 "$srcdir/sqlitebrowser-$pkgver/images/sqlitebrowser.svg" "$pkgdir/usr/share/icons/"
}