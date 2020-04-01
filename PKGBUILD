# Maintainer: Andre Schröder <andre.schroedr at gmail dot com>

# All my PKGBUILDs are managed at https://github.com/schra/pkgbuilds

_name=cgrep-clang
pkgname=$_name
pkgver=1.1
_mainfolder=cgrep-$pkgver
pkgrel=1
pkgdesc='grep for C/C++ source files'
arch=(any)
url=https://github.com/bloodstalker/cgrep
license=(GPL3)
depends=(llvm clang)
makedepends=(git)
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz git+https://github.com/bloodstalker/cfe-extra#commit=0d705a3)
sha256sums=('68e7e66029f643a3a7e745a88bf95516c517aec1739c81ba1f1d3978833c7d80'
            'SKIP')

prepare() {
  cd "$srcdir/$_mainfolder"

  git clone "$srcdir"/cfe-extra
}

package() {
  cd "$srcdir/$_mainfolder"

  make

  # `make install` isn't provided, so we have to manually copy the files
  install -dm755 "$pkgdir"/{usr/bin,usr/share/licenses/$_name}
  install -m 755 cgrep "$pkgdir/usr/bin"
  install -m 644 LICENSE "$pkgdir"/usr/share/licenses/$_name/LICENSE.md
}
