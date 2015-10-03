# Maintainer: Håvard Pettersson <mail@haavard.me>
# Contributor: Florian Hahn <flo at fhahn dot com>

_pkgname=toxic
pkgname=toxic-git
pkgdesc='CLI Frontend in ncurses for Tox'
license=('GPL3')
pkgver=0.6.1.r3.ga920f3e
pkgrel=1
depends=('desktop-file-utils'
         'freealut'
         'libnotify'
         'toxcore')
makedepends=('git')
conflicts=($_pkgname)
provides=($_pkgname)
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url=('http://tox.chat')
source=("${pkgname}::git+https://github.com/Tox/toxic.git")
sha512sums=('SKIP')

install="${pkgname}.install"

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  make PREFIX=/usr
}

package() {
  cd "$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
