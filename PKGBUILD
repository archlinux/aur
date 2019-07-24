# Maintainer: Ivan Zenin <i.zenin@gmx.com>

pkgname=linkchecker-git
pkgver=latest
pkgrel=2
pkgdesc="Check websites for broken links"
arch=('i686' 'x86_64')
url="https://linkcheck.github.io/linkchecker"
license=("GPL")
depends=("python2" "python2-requests" "python2-dnspython" "python2-xdg" "python2-future")
provides=('linkchecker')
conflicts=('linkchecker')
makedepends=('git')
source=("git+git://github.com/linkcheck/linkchecker.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/linkchecker
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "${srcdir}"/linkchecker
  python2 setup.py install \
      --prefix=/usr \
      --root="${pkgdir}"
  find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
}
