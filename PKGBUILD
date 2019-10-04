# Maintainer: Bogdan Sinitsyn <f1u77y@yandex.ru>
pkgname=web-media-controller-mpris-git
pkgver=r91.573b8dd
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
  meson
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

  meson build --buildtype release
}

build() {
  cd "$srcdir/${pkgname%-git}"

  ninja -C build
}

package() {
  cd "$srcdir/${pkgname%-git}"

  DESTDIR="$pkgdir" ninja -C build install
  install -m 755 -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
