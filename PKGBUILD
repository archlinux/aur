# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

pkgname=pacnews-neovim-git
pkgver=v1.0.r0.gd78c8ac
pkgrel=3
pkgdesc="Find .pacnew files and merge them with a neovim diff, updated git tag"
arch=(any)
url="https://github.com/pbrisbin/dotfiles/blob/v1.0/tag-scripts/local/bin/pacnews"
license=('unknown')
depends=('neovim')
makedepends=('git')
provides=('pacnews-git')
conflicts=('pacnews-git')
source=(
  "git+https://github.com/pbrisbin/dotfiles.git#tag=v1.0"
  nvim.patch
)

sha256sums=(
  'SKIP'
  '64ed706fd94cc0340e7c46ee4c8db1076040b6f9a66e4e4f5ebcb9f5157c032d'
)

pkgver() {
	cd "${srcdir}/dotfiles"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/dotfiles"

  patch -Np1 -i "$srcdir/nvim.patch"
}

package() {
	cd "${srcdir}/dotfiles/tag-scripts/local/bin"

  mkdir -p "${pkgdir}/usr/bin"
  install ${pkgname%-neovim-git} "${pkgdir}/usr/bin/"
}
# vim:set ts=2 sw=2 et:
