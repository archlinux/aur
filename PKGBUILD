# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: sudokode <sudokode@gmail.com>
# Contributor: Jason Chu <jason@archlinux.org>
# Contributor: Jesse Young <jesse.young@gmail.com>

pkgname=namcap-git
pkgver=3.2.1.35.g228172a
pkgrel=1
pkgdesc="A Pacman package analyzer (git)"
arch=('any')
url="http://projects.archlinux.org/namcap.git/"
license=('GPL')
depends=('python' 'pyalpm-git' 'licenses' 'binutils' 'elfutils' 'python-pyelftools')
makedepends=('git' 'python-distribute')
provides=('namcap')
conflicts=('namcap')
source=("$pkgname::git+http://projects.archlinux.org/git/namcap.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname

  git describe --always | sed 's/-/./g'
}

check() {
  cd $pkgname

  env PARSE_PKGBUILD_PATH="$srcdir/${pkgname}" \
      PATH="$srcdir/${pkgname}:$PATH" \
      python3 setup.py test
}

package() {
  cd $pkgname

  python ./setup.py install --root="$pkgdir"

  find "$pkgdir" -type d -name '.git' -exec rm -r '{}' +
}

# vim:set ts=2 sw=2 et:
