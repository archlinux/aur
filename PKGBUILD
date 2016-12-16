# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(freedm freedoom1 freedoom2)
pkgbase=freedoom
pkgver=0.10.1
pkgrel=2
pkgdesc="Free game based on the Doom engine"
arch=('any')
url="https://freedoom.github.io/"
license=('BSD')
source=(https://chungy.keybase.pub/freedoom/dist.tar.xz
  https://github.com/freedoom/freedoom/releases/download/v$pkgver/freedm-$pkgver.zip
  https://github.com/freedoom/freedoom/releases/download/v$pkgver/freedoom-$pkgver.zip)
sha256sums=('0dcc2f323d67c7e1f7fbd46191841ee4d97ade76f47889a0049e1bff35cf1e82'
            'da75ebe8af648fc315491f4051d46458b134ad844fc87742551aa1930ccd6857'
            '7d20c4b458b6966a58f8f1d9d67db67999364a66e67616e2c320d01b396338da')

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
