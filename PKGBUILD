# Maintainer:  Rod Kay <rodakay5 at gmail dot com>
# Contributor: Pierre-Marie de Rodat <pmderodat on #ada at freenode.net>

pkgname=libadalang-tools
pkgdesc='Libadalang-based tools for Ada: gnatpp, gnatmetric and gnatstub.'
pkgver=27.0w
pkgrel=1
epoch=1

url='https://github.com/AdaCore/libadalang-tools'
arch=(x86_64)
license=(GPL-3.0-only)

depends=(libadalang templates_parser vss-text)
makedepends=(gprbuild gpr which)

_srcdir="libadalang-tools-27.0w-20260324-16542-src"

source=("https://github.com/charlie5/archlinux-gnatstudio-support/raw/refs/heads/main/gnatstudio-sources-2026/libadalang-tools-src.tar.gz")
sha256sums=('95e6406e33f34eb49451f40bda36f24cdfc4950ada917db645f54727ca8d74cf')


build() {
  cd "$srcdir/$_srcdir"

  export BUILD_MODE=prod

  LIBRARY_TYPE=relocatable make lib
  LIBRARY_TYPE=relocatable make bin
}


package() {
  cd "$srcdir/$_srcdir"

  export DESTDIR="$pkgdir/usr"
  export BUILD_MODE=prod

  LIBRARY_TYPE=relocatable make install-lib
  LIBRARY_TYPE=relocatable make install-bin-strip

  # Install the license.
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
