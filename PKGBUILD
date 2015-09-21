# Maintainer: Aoibhinn di Tori <email@aoibh.in>
# Contributor: Lee T. Starnes <lstarnes1024@gmail.com>

pkgname=luadbi
pkgver=0.5
pkgrel=3
pkgdesc="Database interface library for Lua"
arch=('i686' 'x86_64' 'armv6h')
url="http://code.google.com/p/luadbi/"
license=('MIT')
groups=()
depends=('lua')
makedepends=('lua' 'sqlite3' 'libmariadbclient' 'postgresql' 'postgresql-libs')
checkdepends=()
optdepends=(
  'sqlite3: sqlite backend support'
  'libmariadbclient: MariaDB (or MySQL) backend support'
  'postgresql-libs: PostgreSQL backend support'
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://luadbi.googlecode.com/files/$pkgname.$pkgver.tar.gz" "Makefile.diff")
noextract=()
md5sums=('ede2b003aadddc151aac87050c3d926e'
         '458d1ded068f7923ce6a89660f680d98')

build() {
  cd "$srcdir"
  patch -p1 < Makefile.diff

  # fix suggested by sl1pkn07 on AUR
  # DBI.lua has the path to the lua executable hardcoded
  sed 's|#!/usr/bin/lua5.1|#!/usr/bin/lua|g' -i DBI.lua

  make free
}

package() {
  cd "$srcdir"

  mkdir -p $pkgdir/usr/share/lua/5.1
  cp DBI.lua $pkgdir/usr/share/lua/5.1
  mkdir -p $pkgdir/usr/lib/lua/5.1
  cp *.so $pkgdir/usr/lib/lua/5.1
  mkdir -p $pkgdir/usr/share/licenses/luadbi
  cp COPYING $pkgdir/usr/share/licenses/luadbi
}

