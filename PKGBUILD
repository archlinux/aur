# Maintainer: Martchus <martchus@gmx.net>

pkgname=ubuntu-latex-fonts-git
pkgver=r71.1fe3a42
pkgrel=1
epoch=1
pkgdesc='Enables you to use the original Ubuntu Font Familiy with LaTeX'
arch=('any')
url='https://github.com/tzwenn/ubuntu-latex-fonts'
license=('custom')
depends=('texlive-core')
makedepends=('git')
optdepends=()
conflicts=('ubuntu-latex-fonts')
install=ubuntu-latex-fonts.install
source=("$pkgname"::'git://github.com/tzwenn/ubuntu-latex-fonts.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
}

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/usr/share/texmf-dist/fonts/tfm/ubuntu"
  make "PREFIX=$pkgdir/usr/share/texmf-dist" install

  rm "$pkgdir/usr/share/texmf-dist/ls-R"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 0644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
