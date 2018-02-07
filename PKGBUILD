# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=rgbds2
_pkgname=rgbds
pkgver=0.2.5
pkgrel=2
pkgdesc="Rednex GameBoy Development System (0.2.x)"
arch=('i686' 'x86_64')
url="https://github.com/rednex/rgbds/"
license=('custom')
depends=('glibc')
makedepends=('bison')
source=("https://github.com/rednex/rgbds/releases/download/v$pkgver/rgbds-$pkgver.tar.gz")
sha1sums=('cac03125662ea825248e84a4614da9f8afa8e898')

build() {
  cd "$srcdir"
  make
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/man/man7"
  mkdir -p "$pkgdir/usr/share/man/man1"
  make PREFIX="$pkgdir/usr" MANPREFIX="$pkgdir/usr/share/man" install
  install -D LICENSE "$pkgdir/usr/share/licenses/rgbds2/LICENSE"
  cd "$pkgdir/usr/bin"
  for b in *
    do mv $b ${b}2
  done
  cd "$pkgdir/usr/share/man/man1"
  for m in *.1
    do mv $m ${m%.1}2.1
  done
  cd "$pkgdir/usr/share/man/man7"
  mv rgbds.7 rgbds2.7
}
