# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=heidisql
pkgname=${_basename}-gtk2-bin
pkgver=12.21
pkgrel=1
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite databases. (GTK2)"
arch=('x86_64')
_barch=('amd64')
url="https://github.com/HeidiSQL/HeidiSQL"
license=('GPL-2.0-or-later')
conflicts=("${_basename}" heidisql-client)
provides=("${_basename}")
replaces=("heidisql-bin")
depends=('gtk2' 'mariadb-libs' 'postgresql-libs' 'sqlite' 'freetds')
source=("${_basename}_${pkgver}_${arch[0]}.deb::${url}/releases/download/v${pkgver}/${_basename}_${pkgver}_${_barch[0]}.deb"
	"build-gtk2-v${pkgver}.tgz::${url}/releases/download/v${pkgver}/build-gtk2-v${pkgver}.tgz")
noextract=("build-gtk2-v${pkgver}.tgz")
sha256sums=('52f2e1a4c57bf1be740e143d806d0614d460593d4eb956e64807cc555ff6a294'
            '2528c2e52702ff4c1ffcfdfa5a2b274b449861142446b7c99168a364a50d7bb3')

package() {
  cd "${pkgdir}"

  # this extracts all into the pkgdir
  tar xf "${srcdir}/data.tar.gz"
  # upstream deb changed to qt6 so we need to replace the build with the gtk2 one
  rm -rf usr/bin
  install -dm755 usr/bin
  tar xzf "${srcdir}/build-gtk2-v${pkgver}.tgz" -C usr/bin heidisql
  chmod 755 usr/bin/heidisql

  # fix directory permissions
  find . -type d -exec chmod 755 {} +
  chmod 775 usr/share/doc/heidisql usr/share/heidisql/locale
} 
