# Maintainer:
# Contributor: BrainDamage <braindamage springlobby.info>

_pkgname="eqonomize"
pkgname="$_pkgname"
pkgver=1.5.12
pkgrel=2
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
sha256sums=('de4c15d614fef38d65212235f60b904470152f30dc12073dac522dbae7e5ec4d')

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
