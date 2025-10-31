# Maintainer: Sven Vainküla <sven.zinee@gmail.com>
pkgname=rofi-qalc-git
_gitname='rofi-qalc'
pkgver=1.0.0.r11.g65dc74a
pkgrel=1
pkgdesc='Rofi calculator mode using libqalculate'
arch=('x86_64')
url='https://github.com/svenvvv/rofi-qalc'
license=('GPL-2.0-only')
depends=('rofi' 'libqalculate')
makedepends=('meson' 'git')
source=("git+https://github.com/svenvvv/$_gitname#branch=master")
sha512sums=('SKIP')

pkgver() {
  cd "$_gitname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$_gitname" build \
    -Dlibdir=lib/rofi \
    --buildtype=release \
    --optimization=3
  meson compile -C build
}

package() {
  meson install --destdir "$pkgdir" -C build --no-rebuild
  install -Dm644 "$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
