pkgname=luastatus-git
pkgver=r564.29fa981
pkgrel=1
pkgdesc='luastatus is a universal status bar content generator'
arch=('x86_64')
url='https://github.com/shdown/luastatus'
license=('LGPL3')
depends=('lua' 'libx11' 'bash' 'alsa-lib' 'yajl>=2.1.0' 'xcb-util-wm')
makedepends=('git' 'cmake' 'pkg-config')
conflicts=('luastatus')
provides=('luastatus')
source=(git+https://github.com/shdown/luastatus)
sha1sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib .
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir" install
}
