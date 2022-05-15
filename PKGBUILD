# Maintainer: Ivan Zenin <i.zenin@gmx.com>

pkgname=pinboard-git
pkgver=latest
pkgrel=2
pkgdesc="a full-featured Python wrapper for the Pinboard API (development version)"
arch=('i686' 'x86_64')
url="https://github.com/lionheart/pinboard.py"
license=("Apache")
depends=("python")
provides=('pinboard')
conflicts=('pinboard')
makedepends=('git')
source=("git+https://github.com/lionheart/pinboard.py.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/pinboard.py
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}"/pinboard.py
  python setup.py install \
      --prefix=/usr \
      --root="${pkgdir}"
  find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
}
