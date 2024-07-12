# Maintainer: Swift Geek
pkgname=ncpamixer-git
_pkgname=ncpamixer
pkgver=a
pkgrel=5
pkgdesc="ncurses PulseAudio Mixer"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/fulhax/ncpamixer"
license=('MIT')
depends=('ncurses' 'pulseaudio')
conflicts=(ncpamixer)
provides=(ncpamixer)
makedepends=('git' 'cmake')
source=("git+https://github.com/fulhax/ncpamixer.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_pkgname}"
  cmake -DCMAKE_BUILD_TYPE=release $srcdir/$_pkgname/src\
        -DCMAKE_INSTALL_PREFIX="/usr"
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
