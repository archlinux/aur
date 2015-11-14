# $Id: PKGBUILD 250506 2015-11-09 22:55:21Z heftig $
# Maintainer: Ian Hernandez <badwolfie@archlinux.info>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-terminal-dark-variant
_pkgname=gnome-terminal
pkgver=3.18.2
pkgrel=1
pkgdesc="The GNOME Terminal Emulator - Patched to bring back 'Use dark theme variant' option in preferences"
arch=(i686 x86_64)
license=(GPL)
depends=(vte3 gsettings-desktop-schemas dconf)
makedepends=(intltool itstool docbook-xsl desktop-file-utils
             libnautilus-extension appdata-tools gnome-shell gconf vala yelp-tools)
optdepends=('gconf: settings migration when upgrading from older version')
options=('!emptydirs')
url="http://www.gnome.org"
groups=('gnome')
install=$pkgname.install
conflicts=$_pkgname
source=(http://ftp.gnome.org/pub/gnome/sources/$_pkgname/${pkgver:0:4}/$_pkgname-$pkgver.tar.xz
		$_pkgname-restore-dark.patch)
sha256sums=('5e35c0fa1395258bab83952cfabe4c1828b8655bcd761f8faed70b452bd89efa'
			'5ef48574b93ec5530ce2747012fc0838a5e1ffa265803069a8da79b1be5e1eff')

prepare() {
    cd $_pkgname-$pkgver
    patch -p1 -i ../gnome-terminal-restore-dark.patch
    autoreconf -f -i
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib/$pkgname --disable-static --with-nautilus-extension
  make
}

check() {
  cd $_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
