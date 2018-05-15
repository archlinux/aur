# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=dyncall-git
pkgver=20151201
pkgrel=1
pkgdesc="Generic Dynamic FFI package"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
makedepends=('cmake' 'git' 'make' 'yasm')
url="https://github.com/MoarVM/dyncall"
license=('custom')
source=(git+https://github.com/MoarVM/dyncall)
sha256sums=('SKIP')
provides=('dyncall')
conflicts=('dyncall')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  cmake -DCMAKE_INSTALL_PREFIX=/usr ./
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"

  msg2 'Installing...'
  make DESTDIR="$pkgdir" install
}
