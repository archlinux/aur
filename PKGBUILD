# Maintainer: Håvard Pettersson <mail@haavard.me>
# Contributor: Florian Hahn <flo at fhahn dot com>

_pkgname=toxic
pkgname=toxic-git
pkgdesc='CLI Frontend in ncurses for Tox'
license=('GPL3')
pkgver=r1521.4d73f8b
pkgrel=2
depends=(
  'desktop-file-utils'
  'freealut'
  'libnotify'
  'tox-git'
)
makedepends=('git')
conflicts=($_pkgname)
provides=($_pkgname)
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url=('http://tox.im')
source=("${pkgname}::git+https://github.com/Tox/toxic.git")
sha512sums=('SKIP')

install="${pkgname}.install"

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

