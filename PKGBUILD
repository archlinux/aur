# Maintainer: Håvard Pettersson <mail@haavard.me>
# Contributor: Florian Hahn <flo at fhahn dot com>

_pkgname=toxic
pkgname=toxic-newgroupchat-git
pkgdesc='CLI Frontend in ncurses for Tox'
license=('GPL3')
pkgver=0.7.0.r17.g88e7422
pkgrel=3
depends=(
  'desktop-file-utils'
  'freealut'
  'libnotify'
  'toxcore-newgroupchat'
  'curl'
  'qrencode'
)
makedepends=('git')
conflicts=($_pkgname)
provides=("$_pkgname-newgroupchat")
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url=('https://tox.chat')
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
