# Maintainer: Ilaï Deutel

pkgname='git-machete'
pkgver=2.13.6
pkgrel=1
pkgdesc="Probably the sharpest git repository organizer & rebase/merge workflow automation tool you've ever seen"
arch=('any')
url='https://github.com/VirtusLab/git-machete'
license=('MIT')
depends=('git' 'python')
makedepends=('python-setuptools')
checkdepends=('python-six')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/VirtusLab/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f1e05b5282d2f9a6902b8914b9a9b6320ab0b17729d4f8539cab699b886f514a')

build() {
  cd "$srcdir/$pkgname-${pkgver}"
  python setup.py build
}

check() {
  cd "$srcdir/$pkgname-${pkgver}"
  python -m unittest
}

package() {
  cd "$srcdir/$pkgname-${pkgver}"

  # Install the package
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # Install bash and zsh completions
  install -Dm644 "completion/git-machete.completion.bash" "$pkgdir/usr/share/bash-completion/completions/git-machete"
  install -Dm644 "completion/git-machete.completion.zsh" "$pkgdir/usr/share/zsh/site-functions/_git-machete"

  # Install the license
  install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
