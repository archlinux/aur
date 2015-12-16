# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(freedm freedoom1 freedoom2)
pkgbase=freedoom
pkgver=0.10
pkgrel=1
pkgdesc="Free game based on the Doom engine"
arch=('any')
url="https://freedoom.github.io/"
license=('BSD')
source=(https://dl.dropboxusercontent.com/u/13513277/freedoom/dist.tar.xz
  https://github.com/freedoom/freedoom/releases/download/v$pkgver/freedm-$pkgver.zip
  https://github.com/freedoom/freedoom/releases/download/v$pkgver/freedoom-$pkgver.zip)
sha256sums=('0dcc2f323d67c7e1f7fbd46191841ee4d97ade76f47889a0049e1bff35cf1e82'
            '8bc795579c91a270cc1dea276b418a43d6321c4620d610cbb33d61d02ebe25a1'
            '300cac74fe7f34fed49cb8a4d53d774a3e90898b3f47779f68211e7ee5175f9d')

make_pkg_dirs() {
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/man/man6
  install -d "$pkgdir"/usr/share/games/doom
  install -d "$pkgdir"/usr/share/applications
  install -d "$pkgdir"/usr/share/appdata
  install -d "$pkgdir"/usr/share/icons
}

install_pkg_files() {
  install -m 755 "$srcdir"/dist/freedoom "$pkgdir"/usr/bin/"$1"
  install -m 444 "$srcdir"/dist/"$1".6 "$pkgdir"/usr/share/man/man6
  install -m 444 "$srcdir"/"$1"-"$pkgver"/"$1".wad "$pkgdir"/usr/share/games/doom
  install -m 444 "$srcdir"/dist/"$1".desktop "$pkgdir"/usr/share/applications
  install -m 444 "$srcdir"/dist/"$1".appdata.xml "$pkgdir"/usr/share/appdata
  install -m 444 "$srcdir"/dist/"$1".png "$pkgdir"/usr/share/icons
  install -Dm 444 "$srcdir"/"$1"-"$pkgver"/COPYING "$pkgdir"/usr/share/licenses/"$1"/COPYING
}

prepare() {
  ln -s "$srcdir"/freedoom-"$pkgver" "$srcdir"/freedoom1-"$pkgver"
  ln -s "$srcdir"/freedoom-"$pkgver" "$srcdir"/freedoom2-"$pkgver"
}

package_freedm() {
  make_pkg_dirs
  install_pkg_files freedm
}

package_freedoom1() {
  make_pkg_dirs
  install_pkg_files freedoom1
}

package_freedoom2() {
  provides=('freedoom')

  make_pkg_dirs
  install_pkg_files freedoom2
}
