# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
_modulename=vim-ipython
pkgname=vim-$_modulename
pkgver=0
pkgrel=1
pkgdesc="A two-way integration between Vim and IPython 0.11+"
arch=(any)
url="https://github.com/ivanov/vim-ipython"
license=('')
groups=()
depends=('python2-ipykernel')
makedepends=('vim')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("${url}/archive/master.tar.gz")
sha256sums=('5cee1e2c23deb8731a4ffc5496f5abbccd8109abbd90d8ca11654b106be21376')
package() {
  cd "$srcdir/$_modulename-master"
  installpath="${pkgdir}/usr/share/vim/vimfiles"

  # insert code in pre-python.vim to ipy.vim
  # this sets the default pyx to be python3, which is necessary for arch
  cat >pre-python.vim << EOF
if has('python3')
    set pyx=3
elseif has('python')
    set pyx=2
endif
EOF

  cat pre-python.vim ftplugin/python/ipy.vim > temp.vim
  rm pre-python.vim
  mv temp.vim ftplugin/python/ipy.vim

  # install
  install -d $installpath/ftplugin/python
  install -Dm644 ftplugin/python/* $installpath/ftplugin/python
}
