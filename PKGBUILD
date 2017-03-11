# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=damadamas-icon-theme-git
pkgver=0.1.r0.gdbaf9f1
pkgrel=1
pkgdesc="DamaDamas icons aim to offer a familiar interface to the users"
url="https://github.com/sonakinci41/DamaDamas-icon-theme"
arch=('any')
license=('unknown')
depends=('hicolor-icon-theme')
makedepends=('cmake' 'git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
options=('!strip')
source=("${pkgname%-*}::git+${url}.git")
md5sums=("SKIP")

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-*}"
  cmake . -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make -C "${pkgname%-*}" DESTDIR=$pkgdir install
  mv "$pkgdir/usr/share/icons/maia/apps/scalable/atril.svg kopyası" \
    "$pkgdir/usr/share/icons/maia/apps/scalable/atril.svg"
}
