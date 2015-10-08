# Maintainer: Eugene Yunak <eugene@yunak.eu>
# Contributor: Jakob Matthes <jakob.matthes@gmail.com>

pkgname=vim-markdown
pkgver=2.0.0.r23.45e9f30
pkgver() {
  cd "$srcdir/${pkgname}"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}
pkgrel=1
pkgdesc='Syntax highlighting and matching rules for Markdown.'
arch=('any')
url='https://github.com/plasticboy/vim-markdown'
license=('MIT')
depends=('vim')
makedepends=('git')
source=("${pkgname}::git+https://github.com/plasticboy/vim-markdown.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}"
  for file in $(awk '/ - / {print $2}' registry/markdown.yaml)
  do
    install -D -m644 "${file}" "${pkgdir}/usr/share/vim/vimfiles/${file}"
  done
}

