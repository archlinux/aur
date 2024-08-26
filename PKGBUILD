# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_pkgname=ghost
pkgname=vim-$_pkgname-git
pkgver=r98.115e260
pkgrel=1
pkgdesc="Vim client for GhostText - Edit browser text areas in Vim"
arch=('any')
url="https://github.com/raghur/vim-ghost"
license=()
groups=()
depends=('vim' 'xdotool' 'python' 'python-pynvim' 'nvim-yarp-git' 'python-slugify' 'vim-hug-neovim-rpc-git' 'python-simple-websocket-server-git')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${pkgname%-git}::git+$url.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  installpath="${pkgdir}/usr/share/vim/vimfiles"

  install -d $installpath/{autoload,doc,plugin,python3,pythonx,rplugin/python3}
  for x in {autoload,doc,plugin,python3,pythonx,rplugin/python3}
  do
      install -Dm644 $x/* $installpath/$x/
  done
}
