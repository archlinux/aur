# Maintainer: Håvard Pettersson <mail@haavard.me>
# Contributor: Florian Hahn <flo at fhahn dot com>

_pkgname=toxic
pkgname=toxic-newgc-git
pkgdesc='CLI Frontend in ncurses for Tox'
license=('GPL3')
pkgver=0.7.0.r29.gbcda6e4
pkgrel=1
depends=(
  'desktop-file-utils'
  'freealut'
  'libnotify'
  'toxcore-newgc'
  'curl'
  'qrencode'
)
makedepends=('git')
conflicts=($_pkgname)
provides=("$_pkgname-newgc")
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://tox.chat'
source=("${pkgname}::git+https://github.com/JFreegman/toxic.git")
sha512sums=('SKIP')
install="${pkgname}.install"

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  git checkout new_groupchats
  make PREFIX=/usr DISABLE_X11=1
}

package() {
  cd "$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
