# Maintainer: Marshmallow <marshycity@gmail.com>
pkgname=candyvim-git
pkgver=0.1.1.r0.g45ff2f8
pkgrel=1
pkgdesc="CandyVim WIP"
arch=('any')
url='https://github.com/mrshmllow/CandyVim'
license=()
depends=(
  'neovim'
  'git'
  'ripgrep'
  'npm'
  'sqlite'
  'cmake'
  'cargo')
makedepends=('git')
optdepends=()
install=${pkgname}.install
source=("${pkgname}::git+https://github.com/mrshmllow/CandyVim.git"
  "init-cvim.sh"
  "cvim")
sha256sums=('SKIP'
  '7a8f97474b860bd1e9b20a94768ef96fb69021adfa6ad6b2a999300ab4292915'
  '3187ea04d5dd498061325dd7ae75d067b49172277399f3e5e19b59a82d332ea7')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/candyvim"
  cp -r {lua,snapshots,init.lua} "${pkgdir}/usr/share/candyvim"
  
  install -Dm 755 "${srcdir}/cvim" "${pkgdir}/usr/bin/cvim"
  install -Dm 755 "${srcdir}/init-cvim.sh" "${pkgdir}/usr/share/candyvim/init-cvim.sh"
  install -Dm 644 "utils/config.example.lua" "${pkgdir}/usr/share/doc/candyvim/config.example.lua"
}

