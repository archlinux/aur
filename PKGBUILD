# Maintainer: coki91 <coki at hotmail dot com>
# Maintainer: czaplicki <dev dot czaplicki at icloud dot com>
_pkgname='cmd-polkit'
pkgname="${_pkgname}-git"
pkgver=r268.0b52f76
pkgrel=1
pkgdesc="Command line tool for custom polkit agent UIs"
arch=('x86_64')
url="https://github.com/OmarCastro/cmd-polkit"
license=('LGPL2.1')
depends=('glib2' 'json-glib' 'polkit' 'gtk3')
makedepends=('git' 'meson')
source=("${pkgname}::git+https://github.com/OmarCastro/cmd-polkit.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
