# $Id$
# Maintainer: darkfeline@felesatra.moe
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>
# Contributor: Michael Fellinger <m.fellinger@gmail.com>

pkgname=sqlitebrowser-git
pkgver=v3.8.0.r31.g1efec0c
pkgrel=1
pkgdesc="SQLite Database browser is a light GUI editor for SQLite databases, built on top of Qt"
arch=('i686' 'x86_64')
url="http://sqlitebrowser.org/"
license=('GPL')
provides='sqlitebrowser'
conflicts='sqlitebrowser'
depends=('qt5-base' 'sqlite' 'libxkbcommon-x11')
makedepends=('cmake' 'qt5-tools')
install=sqlitebrowser.install
source=($pkgname'::git+https://github.com/sqlitebrowser/sqlitebrowser.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/^non-daw-v//;s/-/./g'
}

prepare() {
  cd $srcdir/$pkgname
  sed -i 's|Icon=.*|Icon=sqlitebrowser|' distri/sqlitebrowser.desktop
}

build() {
  cd $srcdir/$pkgname
  cmake -DUSE_QT5=TRUE -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd $srcdir/$pkgname
  make install DESTDIR=$pkgdir
  install -Dm0644 distri/sqlitebrowser.desktop $pkgdir/usr/share/applications/sqlitebrowser.desktop
  install -dm0755 $pkgdir/usr/share/icons/
  install -m0644 images/sqlitebrowser.svg $pkgdir/usr/share/icons/
}
