pkgname=sx-git
pkgver=r111.5bbcfd7
pkgrel=1
pkgdesc="Portable base library for C/C++ programs and games"
arch=('any')
url="https://github.com/septag/sx"
license=('BSD')

depends=('glibc')
makedepends=('git' 'cmake')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

source=('git://github.com/septag/sx')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DSX_SHARED_LIB=ON \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
