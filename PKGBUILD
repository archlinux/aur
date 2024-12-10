# Maintainer: Alexey Galakhov <agalakhov@gmail.com>

pkgname='rtpmidid-git'
pkgver=r797.78749d5
pkgrel=2
pkgdesc="RTP MIDI User Space Driver Daemon"
arch=('i686' 'x86_64')
url='https://github.com/davidmoreno/rtpmidid'
license=('GPL3')
depends=('alsa-lib' 'fmt' 'avahi')
makedepends=('git' 'cmake' 'pandoc' 'ninja')
provides=('rtpmidid')
conflicts=('rtpmidid')
source=('rtpmidid-git::git+https://github.com/davidmoreno/rtpmidid.git')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
}

build() {
  cd "$pkgname"
  make PREFIX="/usr" SYSCONFDIR="/etc" build
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" PREFIX="/usr" SYSCONFDIR="/etc" install
}

