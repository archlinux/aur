#!/hint/bash -e
# Maintainer: Adrien Smith <adrien@panissupraomnia.dev>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: sudokode <sudokode@gmail.com>
# Contributor: Jason Chu <jason@archlinux.org>
# Contributor: Jesse Young <jesse.young@gmail.com>

pkgname=namcap-git
pkgver=3.2.7.10.g2090aa7
pkgrel=1
pkgdesc="A Pacman package analyzer (git)"
arch=('any')
url="https://gitlab.archlinux.org/pacman/namcap"
license=('GPL')
depends=('python' 'pyalpm' 'licenses' 'binutils' 'elfutils' 'python-pyelftools')
makedepends=('git' 'python-distribute')
provides=('namcap')
conflicts=('namcap')
source=("$pkgname::git+$url.git")
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
