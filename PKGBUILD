# Maintainer: Bogdan Sinitsyn <bogdan.sinitsyn@gmail.com>
pkgname=web-media-controller-mpris-git
pkgver=r88.6dc99a5
pkgrel=2
pkgdesc="MPRIS proxy for usage with Web Media Controller on GNU/Linux "
arch=('i686' 'x86_64')
url="https://github.com/f1u77y/wmc-mpris"
license=('custom:Unlicense')
depends=(
  glib2
  json-glib
)
makedepends=(
  git
  cmake
  python
)
optdepends=(
  'firefox: could be controlled with this tool'
  'chromium: could be controlled with this tool'
  'google-chrome: could be controlled with this tool'
  'opera: could be controlled with this tool'
)
provides=(${pkgname%-git})
conflicts=(
  ${pkgname%-git}
)
source=("${pkgname%-git}::git+https://github.com/f1u77y/wmc-mpris.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  mkdir -p build
}

build() {
  cd "$srcdir/${pkgname%-git}"

  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"

  cd build
  make DESTDIR="$pkgdir/" install

  cd ..
  install -m 755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
