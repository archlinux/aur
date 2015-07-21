# Maintainer: proudzhu <proudzhu.fdu at gmail.com>

pkgname=eg-git
_pkgname=eg
pkgver=0.1.1.r9.g08d9264
pkgrel=1
pkgdesc="Useful examples at the command line."
arch=('any')
url="https://github.com/srsudar/eg"
license=('MIT')
depends=('python')
makedepends=('git')
provides=('eg' 'python-eg-git')
conflicts=('eg' 'python-eg-git')
replaces=('python-eg-git')
options=(!emptydirs)
source=("$_pkgname::git+https://github.com/srsudar/eg.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
