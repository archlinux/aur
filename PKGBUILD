# Maintainer: Will Handley <wh260@cam.ac.uk>
_modulename=taskwiki
pkgname=vim-$_modulename
pkgver=0.4
pkgrel=1
pkgdesc="Proper project management in vim. Standing on the shoulders of vimwiki and Taskwarrior"
arch=(any)
url="https://github.com/tbabej/taskwiki"
license=('MIT')
groups=()
depends=('python-tasklib' 'task' 'vim' 'vim-vimwiki')
makedepends=('vim')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/master.tar.gz")
sha256sums=('688d31d5491e0d3ce7e1a1082ccb9e000afd8811e8807de35c49b3d4c4275729')
package() {
  cd "$srcdir/$_modulename-master"
  installpath="${pkgdir}/usr/share/vim/vimfiles"

  # Rename and add an extra :h to the script
  mkdir ftplugin/vimwiki
  mv ftplugin/vimwiki.vim ftplugin/vimwiki/taskwiki.vim
  sed  -i 's/sfile>:p/sfile>:p:h/' ftplugin/vimwiki/taskwiki.vim

  install -d $installpath/{after/syntax,doc,extra,ftplugin/vimwiki,taskwiki}
  for x in {after/syntax,doc,extra,ftplugin/vimwiki,taskwiki}
  do
      install -Dm644 $x/* $installpath/$x/
  done
}
