# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Ralf Schmitt <ralf@systemexit.de>

pkgname=python2-gevent-git
pkgver=20141213
pkgrel=1
pkgdesc="Coroutine-based concurrency library for Python"
arch=('i686' 'x86_64')
depends=('python2' 'python2-greenlet')
makedepends=('cython2' 'git' 'python2-setuptools')
url="https://github.com/surfly/gevent"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/surfly/gevent)
sha256sums=('SKIP')
provides=('python2-gevent')
conflicts=('python2-gevent')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  LIBEV_EMBED=1 \
  CARES_EMBED=1 \
  CYTHON=cython2 \
  PYTHON=python2 \
  python2 setup.py build
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

  msg 'Installing...'
  python2 setup.py install -O1 --root="$pkgdir"
}
