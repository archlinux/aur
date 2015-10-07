# Maintainer: Eugene Yunak <eugene@yunak.eu>
# Contributor: Jakob Matthes <jakob.matthes@gmail.com>

pkgname=vim-markdown
pkgver=20150727
pkgrel=1
pkgdesc='Syntax highlighting and matching rules for Markdown.'
arch=('any')
url='https://github.com/plasticboy/vim-markdown'
license=('MIT')
depends=('vim')
makedepends=('git')

_gitroot='https://github.com/plasticboy/vim-markdown.git'
_gitname='vim-markdown'

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."
  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout."
}

package() {
  cd "${srcdir}/${_gitname}"
  install -D -m644 after/ftplugin/mkd.vim ${pkgdir}/usr/share/vim/vimfiles/after/ftplugin/mkd.vim
  install -D -m644 ftdetect/mkd.vim ${pkgdir}/usr/share/vim/vimfiles/ftdetect/mkd.vim
  install -D -m644 syntax/mkd.vim ${pkgdir}/usr/share/vim/vimfiles/syntax/mkd.vim
}

pkgver() {
  date +%Y%m%d
}
