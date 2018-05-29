# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=webmacs-docs-git
pkgver=r489.587abbb
pkgrel=1
_pythonver=3.6
pkgdesc="browser for keyboard-based web navigation"
arch=('any')
url="https://github.com/parkouss/webmacs"
license=('GPL3')
makedepends=('webmacs-git' 'python-sphinx' 'git')
source=("git+https://github.com/parkouss/webmacs#commit=587abbb0cc5e6e1d37b69e727b6177467fbab41f")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-docs-git}"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "${pkgname%-docs-git}"/docs
  make texinfo man 
  cd _build/texinfo
  make
}

package() {
  cd "${pkgname%-docs-git}"/docs/_build/
  
  install -Dm644 texinfo/${pkgname%-docs-git}.info "$pkgdir"/usr/share/info/${pkgname%-docs-git}.info
  install -Dm644 man/${pkgname%-docs-git}.1 "$pkgdir"/usr/share/man/man1/${pkgname%-docs-git}.1
}
