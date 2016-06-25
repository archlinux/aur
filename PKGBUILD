# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: Florian Hahn <flo at fhahn dot com>

_pkgname=toxic
pkgname=toxic-git
pkgdesc='CLI Frontend in ncurses for Tox'
license=('GPL3')
pkgver=0.7.0.r4.g8827082
pkgrel=1
depends=('curl'
         'desktop-file-utils'
         'freealut'
         'libnotify'
         'qrencode'
         'toxcore')
makedepends=('git')
conflicts=($_pkgname)
provides=($_pkgname)
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h')
url='https://tox.chat'
source=("${pkgname}::git+https://github.com/JFreegman/toxic.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  # disable X11 because https://github.com/JFreegman/toxic/issues/277
  make PREFIX=/usr DISABLE_X11=1
}

package() {
  cd "$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
