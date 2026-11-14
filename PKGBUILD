# Maintainer: Felipe BF <fprgw32 at gmail dot com>

_base=cute
_name="${_base}_headers"
_items=(c2 net tiled aseprite sound png spritebatch sync tls)

pkgbase="lib${_name}-git"
pkgname=($(for i in ${_items[@]}; do echo "lib${_base}_$i-git"; done))
pkgver=r996.476d688
pkgrel=1
pkgdesc="Collection of cross-platform one-file C/C++ libraries with no dependencies, primarily used for games (bleeding edge)"
arch=('any')
url="https://github.com/RandyGaul/${_name}"
license=('Zlib OR Unlicense')
makedepends=('git')

source=("${_name}::git+${url}#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# Function generator idea taken from:
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=tesseract-data-git&id=543a8d393c3bbd7afd31284835677d162b14a4e1

for i in ${_items[@]}; do
  eval "
package_lib${_base}_$i-git() {
  provides=('lib${_base}_$i')
  conflicts=('lib${_base}_$i')

  cd \"\$srcdir/${_name}\"
  install -Dm644 \"${_base}_$i.h\" \"\$pkgdir/usr/include/${_base}_$i.h\"

  install -Dm644 LICENSE \"\$pkgdir/usr/share/licenses/\$pkgname/LICENSE\"
}
  "
done

