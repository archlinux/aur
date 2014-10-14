# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(freedm freedoom1 freedoom2)
pkgbase=freedoom
pkgver=0.9
pkgrel=1
pkgdesc="Free game based on the Doom engine"
arch=('any')
url="https://freedoom.github.io/"
license=('BSD')
source=('https://dl.dropboxusercontent.com/u/13513277/freedoom/dist.tar.xz'
  'https://github.com/freedoom/freedoom/releases/download/v0.9/freedm-0.9.zip'
  'https://github.com/freedoom/freedoom/releases/download/v0.9/freedoom-0.9.zip')
sha256sums=('079ae7933ffcea9a3d198e6e8ee9d99a045ce9202e8b9ac7071b4d92d3960425'
            '2fabcf6f1d957d48f81f508788bd1c6a780632dda41b837f9cae32972bdad56c'
            '959695b428992feea180942e510e7a6f0109cc7fd47b0d5293d2dbce951743b6')

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
  # Somehow I find this easier than fixing the other function.
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
