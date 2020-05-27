# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: yesuu zhang <yesuu79@qq.com>
# Contributor: Daniel YC Lin <dlin.tw at> gmail.com>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=gocode-git
pkgver=r785.5bee97b
pkgrel=1
pkgdesc="An autocompletion daemon for the Go programming language"
arch=('i686' 'x86_64')
url="https://github.com/nsf/gocode"
license=('MIT')
depends=('go')
makedepends=('git')
source=('git+https://github.com/nsf/gocode.git')
conflicts=('liteide')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/gocode"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd "${srcdir}/gocode"
  go build -o gocode
}

package() {
  cd "${srcdir}/gocode"
  install -Dm755 gocode "${pkgdir}/usr/bin/gocode"
  install --directory "${pkgdir}/usr/share/vim/vimfiles"
  cp -r vim/autoload "${pkgdir}/usr/share/vim/vimfiles"
  cp -r vim/ftplugin "${pkgdir}/usr/share/vim/vimfiles"
  install -Dm644 emacs/go-autocomplete.el "${pkgdir}/usr/share/emacs/site-lisp/go-autocomplete.el"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/gocode/LICENSE"
}
