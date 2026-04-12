# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=heidisql-qt6
pkgver=12.17
pkgrel=1
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite databases (Qt6)"
arch=(x86_64)
url="http://www.heidisql.com/"
license=('GPL-2.0-or-later')
makedepends=(lazarus make fpc gettext binutils qt6pas)
depends=(qt6pas heidisql mariadb-libs postgresql-libs libperconaserverclient sqlite freetds)
provides=(heidisql-client)

source=("https://github.com/HeidiSQL/HeidiSQL/archive/${pkgver}.tar.gz")
sha256sums=('367ed5ea308ad30ae2303b0c19614e242788a8e5e30b3471c21f1f00d54a09ad')

build() {
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
  lazbuild --lazarusdir=/usr/lib/lazarus -B --bm=Release --ws=qt6 heidisql.lpi
}

package() {
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
  mkdir -p "${pkgdir}/usr/share/heidisql"
  install -Dm755 "out/heidisql" "${pkgdir}/usr/share/heidisql/heidisql-qt6"
  
  install -Dm644 "package-skeleton/usr/share/applications/heidisql.desktop" \
    "${pkgdir}/usr/share/applications/heidisql-qt6.desktop"
  sed -i 's/^Exec=heidisql/Exec=heidisql --qt6/' "${pkgdir}/usr/share/applications/heidisql-qt6.desktop"
  sed -i 's/^Name=HeidiSQL/Name=HeidiSQL (Qt6)/' "${pkgdir}/usr/share/applications/heidisql-qt6.desktop"
}

