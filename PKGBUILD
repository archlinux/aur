# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=editorconfig-geany-git
pkgver=0.2.r4.gb55ebcb
pkgrel=1
pkgdesc="EditorConfig plugin for Geany"
arch=('i686' 'x86_64')
url="https://github.com/editorconfig/editorconfig-geany"
license=('GPL')
depends=('geany' 'editorconfig-core-c')
makedepends=('git')
provides=("editorconfig-geany=$pkgver")
conflicts=('editorconfig-geany')
source=('git+https://github.com/editorconfig/editorconfig-geany.git')
sha256sums=('SKIP')


pkgver() {
  cd "editorconfig-geany"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "editorconfig-geany"

  make EDITORCONFIG_PREFIX="/usr"
}

package() {
  cd "editorconfig-geany"

  install -Dm644 "editorconfig-geany.so" -t "$pkgdir/usr/lib/geany"
}
