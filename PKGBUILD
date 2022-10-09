# Maintainer: Marshmallow <marshycity@gmail.com>
pkgname=candyvim-git
pkgver=0.1.1.r0.g45ff2f8
pkgrel=3
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
  '49e027f57102d887fa117146d58dd91d22a119d3c89df457b4a2f15a5d5e4ac8'
  '6d1c86a865f1687a39fb24a09edbf175319ad21a257c8e06c1debc491b81cf66')

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

