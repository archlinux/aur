# Maintainer:
# Contributor: BrainDamage <braindamage springlobby.info>

_pkgname="eqonomize"
pkgname="$_pkgname"
pkgver=1.5.13
pkgrel=1
pkgdesc="Efficient and easy accounting for the small household economy"
url="https://github.com/Eqonomize/Eqonomize"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'qt6-charts'
  'qt6-base'
  'hicolor-icon-theme'
)

_pkgsrc="$pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/releases/download/v$pkgver/$_pkgsrc.$_pkgext")
sha256sums=('a09c94db58bd938caaffc06a1e83dadcaa98777840461ee843605eaa6ce971fb')

build() {
  cd "$_pkgsrc"
  qmake6 PREFIX=/usr \
    QMAKE_CFLAGS="${CFLAGS}" \
    QMAKE_CXXFLAGS="${CXXFLAGS}" \
    QMAKE_LFLAGS="${LDFLAGS}"
  make
}

package() {
  cd "$_pkgsrc"
  make INSTALL_ROOT="$pkgdir" DESTDIR="$pkgdir" install
}
