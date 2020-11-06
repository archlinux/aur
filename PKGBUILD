# Mantainer: Ramana Kumar <firstname at member.fsf.org>
# Contributor: Ramana Kumar <firstname at member.fsf.org>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>

pkgname=pacnews-neovim-git
pkgver=v1.0.r0.gd78c8ac
pkgrel=1
pkgdesc="Find .pacnew files and merge them with a neovim diff - updated git tag"
arch=(any)
url="https://github.com/pbrisbin/dotfiles/blob/v1.0/tag-scripts/local/bin/pacnews"
license=('unknown')
makedepends=('git')
provides=('pacnews-git')
conflicts=('pacnews-git')
source=(
  "git+https://github.com/pbrisbin/dotfiles.git#tag=v1.0"
  # Patches
  nvim.patch
)
md5sums=('SKIP'
         'c8532d9984cbcb2dc97d2a07bb7a23de')

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
