# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: wostarxi <wostarxi@outlook.com>

pkgname=ranger_devicons-git
_name=${pkgname%-git}
pkgver=r89.de64ab2
pkgrel=1
pkgdesc='Ranger plugin that adds file glyphs/icon support to Ranger'
arch=('any')
url=https://github.com/alexanderjeurissen/ranger_devicons
license=('GPL3')
depends=('ranger' 'ttf-font-nerd')
makedepends=('git')
provides=("$_name")
conflicts=("$_name")
install="$pkgname.install"
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_name"
  python -m compileall .
  python -O -m compileall .
}

package() {
  cd "$_name"
  install -Dm644 -t "$pkgdir"/usr/share/ranger/plugins/"$_name" __init__.py devicons.py
  cp -r __pycache__ "$pkgdir"/usr/share/ranger/plugins/"$_name"
}
