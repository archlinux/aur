# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_pkgname=taskwiki
pkgname=vim-$_pkgname-git
pkgver=r876.0ee63dd
pkgrel=1
pkgdesc="Proper project management in vim. Standing on the shoulders of vimwiki and Taskwarrior"
arch=('any')
url="https://github.com/tools-life/taskwiki"
license=('MIT')
groups=()
depends=('vim' 'python-tasklib' 'task' 'vim' 'vim-vimwiki')
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

  install -d $installpath/{after/{syntax,ftplugin},autoload,doc,extra,ftplugin/vimwiki,taskwiki}
  for x in {after/{syntax,ftplugin},autoload,doc,extra,ftplugin/vimwiki,taskwiki}
  do
      install -Dm644 $x/* $installpath/$x/
  done
}
