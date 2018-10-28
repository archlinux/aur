# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

_pkgname=python-buildbot-pkg
pkgname=python-buildbot-pkg-git
pkgdesc="Utilities and common code for building and testing www plugins."
pkgver=1.5.0.r39.g0fb2a9cc0
pkgrel=2
arch=('any')
url="https://buildbot.net"
license=("GPL2")
depends=('python-setuptools' 'nodejs<11' 'npm' 'yarn' 'python2')
makedepends=('git')
checkdepends=('python-twisted')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(git+https://github.com/buildbot/buildbot.git)
sha256sums=('SKIP')

pkgver() {
  cd buildbot
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
  )
}

build() {
  cd buildbot/pkg

  python setup.py build
}

check() {
  cd buildbot/pkg

  python test_buildbot_pkg.py
}

package() {
  cd buildbot/pkg

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
