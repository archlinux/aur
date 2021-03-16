# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

# This is intended as a generic data package for open source Doom 3
# engines.  The omission of game*.pk4 files is intentional, as they
# are the game code built for the proprietary Linux (32-bit), Windows,
# Mac versions.

pkgname=doom3-data
pkgver=1.3.1.1304
pkgrel=5
pkgdesc="Doom 3 patch data files; not the full game!"
url="https://www.idsoftware.com/"
arch=('any')
license=('custom')
install=doom3-data.install
source=("https://youfailit.net/pub/idgames/idstuff/doom3/linux/doom3-linux-$pkgver.x86.run")
b2sums=('ac69b20193b188556143ff57464f81c088dc008abfda98ff49d8a2d802fa06ff383e6bcde4a8a056066e8cd663a07fa01f4f171e30ec5fe9185fd975a13efb60')

build() {
  cd "$srcdir"

  /bin/sh doom3-linux-$pkgver.x86.run --noexec --target doom3-data

  printf Resurrection\ of\ Evil > roe_desc.txt
}

package() {
  cd "$srcdir/doom3-data"

  install -d "$pkgdir"/usr/share/games/doom3/{base,d3xp}
  install -Dm 644 doom3.png "$pkgdir"/usr/share/icons/doom3.png
  install -m 644 base/pak00{5,6,7,8}.pk4 "$pkgdir"/usr/share/games/doom3/base
  install -m 644 d3xp/pak001.pk4 "$pkgdir"/usr/share/games/doom3/d3xp
  install -m 644 ../roe_desc.txt "$pkgdir"/usr/share/games/doom3/d3xp/description.txt
  ln -s games/doom3 "$pkgdir"/usr/share/doom3

  install -Dm 644 License.txt "$pkgdir"/usr/share/licenses/doom3-data/license.txt
}
