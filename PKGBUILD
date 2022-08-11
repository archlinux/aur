# Maintainer: Daniel Souza <danisztls@gmail.com>

_gitbranch=main
_gitauthor=danisztls
pkgname=journal-git
pkgver=v1.1.2.r25.g61507a6
pkgrel=2
pkgdesc="An agnostic approach to note management and personal organization."
arch=('any')
license=('GPL3')
url="https://github.com/${_gitauthor}/${pkgname%-git}"
source=("git+https://github.com/${_gitauthor}/${pkgname%-git}.git#branch=${_gitbranch}")
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
  make DESTDIR="${pkgdir}/" install
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname%-git}"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname%-git}"
}
