# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=mesonlsp
pkgver=4.1.0
pkgrel=1
pkgdesc='Meson language server'
arch=('x86_64')
url=https://github.com/JCWasmx86/mesonlsp
license=('GPL-3.0-or-later')
depends=(
  'curl'
  'git'
  'libarchive.so'
  'libpkgconf.so'
  'libuuid.so'
  'mercurial'
  'patch'
  'subversion'
  'tree-sitter'
)
makedepends=('meson' 'nlohmann-json' 'ninja')
source=("git+$url.git#tag=v$pkgver")
b2sums=('2e179c119da1a98a31e1a38b9f22e729ca7ec1a1418d8408bd7b053d81bfc8a2b24749cab45b6354d7b34ff09bccc352a2f7ffd8e2bd6f5d72af76f3096c0f53')

build() {
  local _meson_options=(
    --wrap-mode default

    -Dbenchmarks=false
    -Dtests=false
    -Duse_own_tree_sitter=false
  )

  cd $pkgname
  arch-meson build "${_meson_options[@]}"
  meson compile -C build
}

package() {
  cd $pkgname
  DESTDIR="$pkgdir" ninja -C build install
}
