# Maintainer: Mingi Sung <fiestalake@disroot.org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=evolution-on-appindicator
_pkgname=evolution-on
pkgver=3.24.2
pkgrel=4
pkgdesc='Tray plugin for the Evolution email client'
arch=('x86_64')
url='https://github.com/acidrain42/evolution-on'
license=('GPL2')
depends=('evolution' 'libnotify' 'libappindicator-gtk3')
makedepends=('git' 'gnome-common')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7f6c048c052ecab2efefaeddaba9db8f7f63035c5505fce0b9c260b5cf2044fe0c4d90a2e7461e1643f507daa1d3a871be9c16e58311d229697d9ce11faa82cf')

prepare() {
  cd $_pkgname-$pkgver

  sed -i '/AM_GCONF_SOURCE_2/d' configure.ac

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname-$pkgver

  ./configure --prefix=/usr --with-libappindicator=yes

  make
}

package() {
  cd $_pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}
