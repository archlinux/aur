# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

pkgname=ubuntu-latex-fonts-git
pkgver=r71.1fe3a42
pkgrel=2
epoch=1
pkgdesc='Enables you to use the original Ubuntu Font Familiy with LaTeX'
arch=('any')
url='https://github.com/tzwenn/ubuntu-latex-fonts'
license=('custom')
depends=('texlive-core')
makedepends=('git')
optdepends=()
conflicts=('ubuntu-latex-fonts')
source=("$pkgname"::'git+https://github.com/tzwenn/ubuntu-latex-fonts.git')
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
  install -d "$pkgdir/usr/share/texmf-dist/fonts/afm/ubuntu"
  make PREFIX="$pkgdir/usr/share/texmf-dist" install

  rm "$pkgdir/usr/share/texmf-dist/ls-R"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -m 0644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}
