# Maintainer: Daniel Souza <danisztls@gmail.com>

_gitbranch=main
_gitauthor=lbcnz
pkgname=journal-git
pkgver=v1.0.2.r0.gf16b825
pkgrel=1
pkgdesc="An agnostic approach to note management and personal organization."
arch=('any')
license=('GPL3')
url="https://github.com/${_gitauthor}/${pkgname%-git}"
source=("git://github.com/${_gitauthor}/${pkgname%-git}#branch=${_gitbranch}")
sha512sums=('SKIP')
depends=('ripgrep' 'fd' 'fzf' 'bat')
makedepends=(git)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  # Use last tag
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  
  install -Dm755 journal "${pkgdir}/usr/bin/journal"
  install -vDm 644 syntax/markdown.vim "${pkgdir}/usr/share/${pkgname%-git}/markdown.vim"
  install -vDm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
}
