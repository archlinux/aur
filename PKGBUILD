# Maintainer: Mushroom King
# Contributor: <darkfeline@felesatra.moe>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>
# Contributor: Michael Fellinger <m.fellinger@gmail.com>
# Contributor: nixi <nixi at cock dot li>

pkgname=sqlitebrowser-cipher
pkgver=v3.10.0
pkgrel=1
pkgdesc="SQLite Database browser is a light GUI editor for SQLite databases, built on top of Qt (with sqlcipher support)"
arch=('i686' 'x86_64')
url="http://sqlitebrowser.org/"
license=('GPL')
provides=('sqlitebrowser')
conflicts=('sqlitebrowser')
depends=('qt5-base' 'sqlite' 'libxkbcommon-x11' 'sqlcipher')
makedepends=('cmake' 'qt5-tools' 'sqlcipher')
install=sqlitebrowser.install
source=($pkgname'::git+https://github.com/sqlitebrowser/sqlitebrowser.git#branch=v3.10.x')
md5sums=('SKIP')

build() {
  cd $srcdir/$pkgname
  cmake -Dsqlcipher=1 -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $srcdir/$pkgname
  make install DESTDIR=$pkgdir
  install -Dm0644 distri/sqlitebrowser.desktop $pkgdir/usr/share/applications/sqlitebrowser.desktop
  install -dm0755 $pkgdir/usr/share/icons/
  install -m0644 images/sqlitebrowser.svg $pkgdir/usr/share/icons/
}
