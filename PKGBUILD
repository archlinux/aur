# Maintainer: Ivan Zenin <i.zenin@gmx.com>

pkgname=linkchecker-git
pkgver=v9.4.0.r314.g7d55855f
pkgrel=1
pkgdesc="Check websites for broken links"
arch=('i686' 'x86_64')
url="https://linkcheck.github.io/linkchecker"
license=("GPL")
depends=("python" "python-beautifulsoup4" "python-requests>=2.4" "python-xdg" "python-dnspython" "python-future")
optdepends=("python-argcomplete")
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
  python setup.py install \
      --prefix=/usr \
      --root="${pkgdir}"
  find "${pkgdir}" -type d -name .git -exec rm -r '{}' +
}
