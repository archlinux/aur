# Maintainer: midgard <arch dot midgard "at symbol" janmaes "youknowwhat" com>
# Contributor: Kirill Klenov <horneds@gmail.com>
# Contributor: Mikhail felixoid Shiryaev <mr dot felixoid na gmail com>

pkgname=neovim-kotlin
pkgver=r77.f338707
pkgrel=1
pkgdesc='Kotlin highlighting and indentation for NeoVim'
arch=('any')
license=('LGPL3')
url='https://github.com/udalov/kotlin-vim'
depends=('neovim')
source=("git+https://github.com/udalov/kotlin-vim.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/kotlin-vim"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}/kotlin-vim"

  local i
  for i in syntax indent ftdetect; do
    install -Dm644 ${i}/kotlin.vim "${pkgdir}/usr/share/nvim/runtime/${i}/kotlin.vim"
  done
}

# vim:set ts=2 sw=2 tw=100 et:
