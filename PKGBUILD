# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-randomwallpaper-git
_pkgname=RandomWallpaperGnome3
pkgver=2.7.2.r0.g5d0e1ec
pkgrel=1
pkgdesc="Fetch a random wallpaper from an online source and set it as a desktop background.  The desktop background can be updated periodically or manually."
arch=('any')
url="https://github.com/ifl0w/RandomWallpaperGnome3"
license=('MIT')
depends=('gnome-shell')
makedepends=('git' 'zip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname%-git}"

  ./build.sh
}

package() {
  cd "${_pkgname%-git}"

  uuid=randomwallpaper@iflow.space
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
  bsdtar -xvf ${uuid}.zip -C "$pkgdir/usr/share/gnome-shell/extensions/${uuid}"
}
