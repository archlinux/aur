pkgname=emacs-groovy-mode-git
provides=('emacs-groovy-mode')
pkgver=2.0.r44.gf80b679
pkgrel=1
pkgdesc="Emacs Mode for Groovy."
arch=('any')
url="https://github.com/Groovy-Emacs-Modes/groovy-emacs-modes.git"
license=('GPL3')
source=('emacs-groovy-mode-git::git+https://github.com/Groovy-Emacs-Modes/groovy-emacs-modes.git')
makedepends=('git')
md5sums=('SKIP')
install=emacs-groovy-mode-git.install

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  depends=('emacs>=24.0.0' 'emacs-s' 'emacs-dash')

  cd "${srcdir}/${pkgname}"
  install -D -m644 -t "${pkgdir}/usr/share/emacs/site-lisp" groovy-mode.el
}
