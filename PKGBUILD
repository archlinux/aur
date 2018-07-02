# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Forked from aur/buildbot. Original contributors:
# Contributor: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgbase=buildbot-www-git
pkgname=('python-buildbot-www-git' 'python-buildbot-waterfall-view-git'
         'python-buildbot-console-view-git' 'python-buildbot-grid-view-git' 'python-buildbot-wsgi-dashboards-git'
         )
pkgver=1.2.0.r40.g16dff07ce
pkgrel=1
arch=('any')
url="https://buildbot.net"
license=("GPL")
makedepends=('git' "buildbot-git=$pkgver" "buildbot-pkg-git=$pkgver" 'python-mock' 'npm' 'yarn')
source=(git+https://github.com/buildbot/buildbot.git)
sha256sums=('SKIP')

pkgver() {
  cd buildbot
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


package_python-buildbot-www-git() {
  depends=("buildbot-git=$pkgver")
  pkgdesc="Buildbot UI"

  cd buildbot/www/base
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python-buildbot-waterfall-view-git() {
  depends=("buildbot-git=$pkgver")
  pkgdesc="Buildbot Waterfall View plugin"

  cd buildbot/www/waterfall_view
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python-buildbot-console-view-git() {
  depends=("buildbot-git=$pkgver")
  pkgdesc="Buildbot Console View plugin"

  cd buildbot/www/console_view
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python-buildbot-grid-view-git() {
  depends=("buildbot-git=$pkgver")
  pkgdesc="Buildbot Grid View plugin"

  cd buildbot/www/grid_view
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python-buildbot-wsgi-dashboards-git() {
  depends=("buildbot-git=$pkgver")
  pkgdesc="Buildbot plugin to integrate flask or bottle dashboards to buildbot UI"

  cd buildbot/www/wsgi_dashboards
  python setup.py install --root="$pkgdir" --optimize=1
}
