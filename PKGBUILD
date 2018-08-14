# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

_pkgname=buildbot-pkg
pkgname=buildbot-pkg-git
pkgdesc="Utilities and common code for building and testing www plugins."
pkgver=1.2.0.r43.g55fc75395
pkgrel=2
arch=('any')
url="https://buildbot.net"
license=("GPL")
depends=('python-setuptools')
makedepends=('git')
checkdepends=('python-twisted')
provides=("$_pkgname=$pkgver")
conflicts=($_pkgname)
source=(git+https://github.com/buildbot/buildbot.git)
sha256sums=('SKIP')

pkgver() {
  cd buildbot
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

check() {
  cd buildbot/pkg

  python test_buildbot_pkg.py
}

package() {
  cd buildbot/pkg
  python setup.py install --root="$pkgdir" --optimize=1
}
