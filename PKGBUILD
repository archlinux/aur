# Maintainer: czaplicki <dev dot czaplicki at icloud dot com>
pkgname='cmd-polkit-git'
pkgver=r8.069d66b
pkgrel=1
pkgdesc="Command line tool for custom polkit agent UIs"
arch=('x86_64')
url="https://github.com/OmarCastro/cmd-polkit"
license=('MIT')
depends=('glib2' 'json-glib' 'polkit' 'gtk3')
makedepends=('git' 'meson')
source=("${pkgname}-${pkgver}::git+https://github.com/OmarCastro/cmd-polkit.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}-${pkgver}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
