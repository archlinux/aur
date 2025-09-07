# Maintainer:  Yusuf Aktepe <yusuf@yusufaktepe.com>
# Contributor: David Lasek <mail at davidlasek dot eu>

_name=rofi-blocks
pkgname=${_name}-git
pkgver=r170.d75a9da
pkgrel=1
pkgdesc="Rofi modi for controlling rofi content through communication with an external program"
arch=("any")
url="https://github.com/OmarCastro/rofi-blocks"
license=('GPL')
depends=('rofi' 'json-glib')
makedepends=('git' 'meson')
source=("git+https://github.com/OmarCastro/rofi-blocks")
md5sums=('SKIP')

pkgver() {
  cd ${_name}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD | sed 's/-/./g')"
}

build() {
  arch-meson rofi-blocks build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir" --no-rebuild
  install -Dm644 ${_name}/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
