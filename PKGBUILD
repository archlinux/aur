# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=heidisql-gtk2
pkgver=12.18
pkgrel=1
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite databases (GTK2)"
arch=(x86_64)
url="http://www.heidisql.com/"
license=('GPL-2.0-or-later')
makedepends=(lazarus make fpc gettext binutils gtk2)
depends=(gtk2 heidisql mariadb-libs postgresql-libs libperconaserverclient sqlite freetds)
provides=(heidisql-client)

source=("https://github.com/HeidiSQL/HeidiSQL/archive/v${pkgver}.tar.gz")
sha256sums=('c20aaf80b2d7927c978ed8f84ab0c69678333d4d5b7ae0920fb71665392dc811')

build() {
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
  lazbuild --lazarusdir=/usr/lib/lazarus -B --bm=Release --ws=gtk2 heidisql.lpi
}

package() {
  cd "${srcdir}/HeidiSQL-${pkgver}"
  
  mkdir -p "${pkgdir}/usr/share/heidisql"
  install -Dm755 "out/heidisql" "${pkgdir}/usr/share/heidisql/heidisql-gtk2"
  
  install -Dm644 "package-skeleton/usr/share/applications/heidisql.desktop" \
    "${pkgdir}/usr/share/applications/heidisql-gtk2.desktop"
  sed -i 's/^Exec=heidisql/Exec=heidisql --gtk2/' "${pkgdir}/usr/share/applications/heidisql-gtk2.desktop"
  sed -i 's/^Name=HeidiSQL/Name=HeidiSQL (GTK2)/' "${pkgdir}/usr/share/applications/heidisql-gtk2.desktop"
}

