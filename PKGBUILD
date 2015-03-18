# Maintainer: Thomas Jost <schnouki@schnouki.net>
pkgname=git-wip-git
pkgver=r55.9655ff9
pkgrel=1
pkgdesc="Help track git Work In Progress branches "
arch=(any)
url="https://github.com/bartman/git-wip"
license=('GPL')
depends=('git' 'bash')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/bartman/git-wip')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 git-wip "$pkgdir"/usr/bin/git-wip

  for f in git-wip git-wip-mode; do
    install -Dm644 emacs/$f.el "$pkgdir"/usr/share/emacs/site-lisp/$f.el
  done
  install -Dm644 vim/plugin/git-wip.vim "$pkgdir"/usr/share/vim/vimfiles/plugin/git-wip.vim

  # FIXME: where should the Sublime Text plugin be installed?
}
