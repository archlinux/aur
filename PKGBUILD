# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# This is intended as a generic data package for open source Doom 3
# engines.  The omission of game*.pk4 files is intentional, as they
# are the game code built for the proprietary Linux (32-bit), Windows,
# Mac versions.

pkgname=doom3-data
pkgver=1.3.1.1304
pkgrel=2
pkgdesc="Doom 3 patch data files; not the full game!"
url="http://www.idsoftware.com/"
arch=('any')
license=('custom')
install=doom3-data.install
source=("http://youfailit.net/pub/idgames/idstuff/doom3/linux/doom3-linux-$pkgver.x86.run")
sha256sums=('2f90dff20f2d3c0c47f17b3d6d45c4f0e7d27b986bf6084f21b85180cd1e03b4')

build() {
  cd "$srcdir"

  /bin/sh doom3-linux-$pkgver.x86.run --noexec --target doom3-data

  echo -n Resurrection\ of\ Evil > roe_desc.txt
}

package() {
  cd "$srcdir/doom3-data"

  install -d "$pkgdir"/usr/share/doom3/{base,d3xp}
  install -Dm 644 doom3.png "$pkgdir"/usr/share/icons/doom3.png
  install -m 644 base/pak00{5,6,7,8}.pk4 "$pkgdir"/usr/share/doom3/base
  install -m 644 d3xp/pak001.pk4 "$pkgdir"/usr/share/doom3/d3xp
  install -m 644 ../roe_desc.txt "$pkgdir"/usr/share/doom3/d3xp/description.txt

  install -Dm 644 License.txt "$pkgdir"/usr/share/licenses/doom3-data/license.txt
}
