# Maintainer: George Tsiamasiotis <gtsiam@windowslive.com>
# vim: set ts=2 sw=2 et:

_name=middleclickclose
pkgname=gnome-shell-extension-$_name-git
pkgver=git
pkgrel=1
pkgdesc='Close windows with a button click when in overview mode'
arch=(any)
url="https://github.com/p91paul/$_name"
license=(GPL-2.0-or-later)

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

makedepends=(git unzip)
depends=(gnome-shell)

source=("git+https://github.com/p91paul/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd $_name

  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd $_name

  make pack
}

package() {
  cd $_name

  make install-system PREFIX="$pkgdir/usr"
}

