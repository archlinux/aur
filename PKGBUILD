# Maintainer: Eugene Yunak <eugene@yunak.eu>
# Contributor: Jakob Matthes <jakob.matthes@gmail.com>

pkgname=vim-markdown
pkgver=20151007
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
  for file in $(awk '/ - / {print $2}' registry/markdown.yaml)
  do
    install -D -m644 "$file" "${pkgdir}/usr/share/vim/vimfiles/$file"
  done
}

pkgver() {
  date +%Y%m%d
}
