# Maintainer: Ivan Zenin <i.zenin@gmx.com>

pkgname=linkchecker-git
pkgver=latest
pkgrel=4
pkgdesc="Check websites for broken links (development version)"
arch=('i686' 'x86_64')
url="https://linkchecker.github.io/linkchecker"
license=("GPL")
depends=("python>=3.5" "python-beautifulsoup4" "python-requests>=2.4" "python-xdg" "python-dnspython" "python-future")
optdepends=("python-argcomplete")
provides=('linkchecker')
conflicts=('linkchecker')
makedepends=('git')
source=("git+https://github.com/linkchecker/linkchecker.git")
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
  python setup.py install \
      --prefix=/usr \
      --root="${pkgdir}"
  find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
}
