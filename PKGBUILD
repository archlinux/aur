# Maintainer:  Lukas K. <lu@0x83.eu>

pkgname=horizon-eda
pkgver=2.4.0
pkgrel=4
pkgdesc="free EDA package written in C++"
arch=('x86_64' 'i686')
url="https://horizon-eda.org"
license=('GPL')
depends=('zeromq' 'gtkmm3' 'cairomm' 'librsvg' 'sqlite3' 'libgit2' 'curl' 'opencascade' 'podofo-0.9' 'libarchive' 'libspnav' 'cppzmq')
makedepends=('boost-libs' 'boost' 'glm' 'python3')
source=(
  "https://github.com/horizon-eda/horizon/archive/v${pkgver}.tar.gz"
  "https://github.com/horizon-eda/horizon/commit/0f77716239dee9a77f2fd1476e0a77323823de57.patch"
  "https://github.com/horizon-eda/horizon/commit/1b2fb023be57fc2694da4bfda66a47f6dbc5be27.patch"
)
sha256sums=(
  'e1165ec11dc222fd5c41a1da752b2aae44eca80f6f785dd4069dcdd225ae1d53'
  '4d5d68b73320685053661398e17ba4221b2fb394a7c294d81007852ebf9443cf'
  '5da1179ff34fefa04dfca2f47c7ec40dc24b79d10fae76dec59d27b211c1431a')

prepare() {
    cd "$srcdir/horizon-$pkgver"
    patch -p1 < ../0f77716239dee9a77f2fd1476e0a77323823de57.patch
    patch -p1 < ../1b2fb023be57fc2694da4bfda66a47f6dbc5be27.patch
}

build() {
    cd "$srcdir/horizon-$pkgver"
    make
}

package() {
    cd "$srcdir/horizon-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install install-man
}
