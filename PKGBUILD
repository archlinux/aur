# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Forked from aur/buildbot. Original contributors:
# Contributor: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgbase=buildbot-www-git
pkgname=('python-buildbot-www-git' 'python-buildbot-waterfall-view-git'
         'python-buildbot-console-view-git' 'python-buildbot-grid-view-git'
         'python-buildbot-wsgi-dashboards-git' 'python-buildbot-badges-git'
         )
pkgver=1.3.0.r2.g95fc42ba3
pkgrel=1
arch=('any')
url="https://buildbot.net"
license=("GPL2")
makedepends=('git' 'buildbot-git' 'python-buildbot-pkg-git' 'python-mock' 'npm' 'yarn' 'python2')
source=(git+https://github.com/buildbot/buildbot.git
        cairosvg2.patch)
sha256sums=('SKIP'
            'efb460cb040cfd2438d63df51cc7ffd93444dd9d6e1b172f870f4ffce5bafda8')

pkgver() {
  cd buildbot
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd buildbot

  patch -Np1 -i ../cairosvg2.patch
}

package_python-buildbot-www-git() {
  depends=('buildbot-git')
  pkgdesc="Buildbot UI"

  cd buildbot/www/base
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python-buildbot-waterfall-view-git() {
  depends=('buildbot-git')
  pkgdesc="Buildbot Waterfall View plugin"

  cd buildbot/www/waterfall_view
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python-buildbot-console-view-git() {
  depends=('buildbot-git')
  pkgdesc="Buildbot Console View plugin"

  cd buildbot/www/console_view
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python-buildbot-grid-view-git() {
  depends=('buildbot-git')
  pkgdesc="Buildbot Grid View plugin"

  cd buildbot/www/grid_view
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python-buildbot-wsgi-dashboards-git() {
  depends=('buildbot-git')
  pkgdesc="Buildbot plugin to integrate flask or bottle dashboards to buildbot UI"

  cd buildbot/www/wsgi_dashboards
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python-buildbot-badges-git() {
  depends=('buildbot-git' 'python-klein' 'python-cairosvg' 'python-cairocffi' 'python-jinja')
  pkgdesc="Buildbot badges"

  cd buildbot/www/badges
  python setup.py install --root="$pkgdir" --optimize=1
}
