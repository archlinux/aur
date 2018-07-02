# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>
# Forked from aur/buildbot. Original contributors:
# Contributor: xRemaLx <anton.komolov@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgbase=buildbot-git
pkgname=('buildbot-git' 'buildbot-worker-git')
pkgver=1.2.0.r40.g16dff07ce
pkgrel=1
arch=('any')
url="https://buildbot.net"
license=("GPL")
makedepends=('git'
             'python-twisted' 'python-jinja' 'python-zope-interface' 'python-future'
             'python-sqlalchemy-migrate' 'python-dateutil' 'python-txaio'
             'python-autobahn' 'python-pyjwt')
source=(git+https://github.com/buildbot/buildbot.git)
sha256sums=('SKIP')

pkgver() {
  cd buildbot
  ( set -o pipefail
    git describe --long --tag 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


package_buildbot-git() {
  depends=('python-twisted' 'python-jinja' 'python-zope-interface' 'python-future'
           'python-sqlalchemy-migrate' 'python-dateutil' 'python-txaio'
           'python-autobahn' 'python-pyjwt')
  pkgdesc="The Continuous Integration Framework"

  cd buildbot/master
  python setup.py install --root="$pkgdir" --optimize=1
}

package_buildbot-worker-git() {
  pkgdesc="Buildbot Worker Daemon"
  depends=('python-twisted' 'python-future')

  cd buildbot/worker
  python setup.py install --root="$pkgdir" --optimize=1
}
