# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=python-click-repl-git
_pkgname=click-repl
pkgver=latest
pkgrel=1
pkgdesc="Subcommand REPL for click apps."
arch=('any')
url="https://github.com/untitaker/${_pkgname}"
license=('MIT')
depends=('python-click' 'python-prompt_toolkit')
options=(!emptydirs)
source=("git+https://github.com/untitaker/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

