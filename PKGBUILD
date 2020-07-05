# Maintainer: Alexey Galakhov <agalakhov@gmail.com>

pkgname='rtpmidid-git'
pkgver=r287.978e076
pkgrel=1
pkgdesc="RTP MIDI User Space Driver Daemon"
arch=('i686' 'x86_64')
url='https://github.com/davidmoreno/rtpmidid'
license=('GPL3')
depends=('alsa-lib' 'fmt' 'avahi')
# aww, moved away from fltk
makedepends=('git' 'cmake')
provides=('rtpmidid')
conflicts=('rtpmidid')
source=('rtpmidid-git::git+https://github.com/davidmoreno/rtpmidid.git')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  #git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
}

build() {
  cd "$pkgname"
  make build
}

package() {
  cd "$pkgname"
  make PREFIX="$pkgdir" install
}

