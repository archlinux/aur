# Maintainer: Marshmallow <marshycity@gmail.com>
pkgname=candyvim-git
pkgver=0.1.0.r3.gd5a2b3f
pkgrel=1
pkgdesc="CandyVim WIP"
arch=('any')
url='https://github.com/mrshmllow/CandyVim'
license=()
depends=(
  'neovim'
  'lua'
  'git'
  'ripgrep'
  'npm'
  'cargo')
makedepends=('git')
optdepends=()
install=${pkgname}.install
source=("${pkgname}::git+https://github.com/mrshmllow/CandyVim.git"
  "init-cvim.sh"
  "cvim")
sha256sums=('SKIP'
  'bf7458c4708eb53996a8b98994d271523f7bf3ca5067702d7e749a14115b9b9f'
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

