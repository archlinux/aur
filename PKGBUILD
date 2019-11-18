# Maintainer: Clemens Brunner <clemens dot brunner at gmail dot com>
pkgname=sigviewer
pkgver=0.6.4
pkgrel=2
pkgdesc="A viewing application for biosignals"
arch=('i686' 'x86_64')
url="https://github.com/cbrnr/sigviewer"
license=('GPL')
groups=()
depends=('qt5-base' 'libbiosig' 'libxdf')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/cbrnr/sigviewer/archive/v$pkgver.zip
        sigviewer.patch
        sigviewer.desktop)
noextract=()
sha1sums=('24fc74e32cde09066ae3bc2ab0c553a72d886e86'
          '5d61d2fd18876c4ad8c6b0840a31da01d3f517d6'
          '72fc9741a985ef783c2c3e7ea5b51655ebc94d84')

build() {
  patch "$srcdir/sigviewer-$pkgver/sigviewer.pro" sigviewer.patch
  cd "$srcdir/sigviewer-$pkgver"
  qmake
  make
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/icons"
  cp "$srcdir/sigviewer-$pkgver/bin/release/sigviewer" "$pkgdir/usr/bin"
  cp sigviewer.desktop "$pkgdir/usr/share/applications"
  cp "$srcdir/sigviewer-$pkgver/sigviewer.svg" "$pkgdir/usr/share/icons"
}
