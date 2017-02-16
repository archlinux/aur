# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(freedm freedoom1 freedoom2)
pkgbase=freedoom
pkgver=0.11
pkgrel=1
pkgdesc="Free game based on the Doom engine"
arch=('any')
url="https://freedoom.github.io/"
license=('BSD')
source=(https://chungy.keybase.pub/freedoom/dist.tar.xz
  https://github.com/freedoom/freedoom/releases/download/v$pkgver/freedm-$pkgver.zip
  https://github.com/freedoom/freedoom/releases/download/v$pkgver/freedoom-$pkgver.zip)
sha256sums=('ad0c9607b02360652e2d8e9237311aa315465342bc8f1978cc6aeb429a45649b'
            '23974faa5b63e20e93e74f3dad671c23f6917c96fc96b32d1131ce358d753a46'
            '00efcb9975308d36d63143a25066ccfca14c9648906418a037bc2a2420f86181')

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
  ln -Tsf "$srcdir"/freedoom-"$pkgver" "$srcdir"/freedoom1-"$pkgver"
  ln -Tsf "$srcdir"/freedoom-"$pkgver" "$srcdir"/freedoom2-"$pkgver"
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
