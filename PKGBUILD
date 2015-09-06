# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: Ralf Schmitt <ralf@systemexit.de>
# Contributor: yafengabc <yafengabc@gmail.com>

pkgname=python-gevent-git
pkgver=20150904
pkgrel=1
pkgdesc="Coroutine-based concurrency library for Python"
arch=('i686' 'x86_64')
depends=('python' 'python-greenlet')
makedepends=('cython' 'git' 'python-setuptools')
url="https://github.com/surfly/gevent"
license=('MIT')
source=(${pkgname%-git}::git+https://github.com/surfly/gevent)
sha256sums=('SKIP')
provides=('python-gevent')
conflicts=('python-gevent')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  LIBEV_EMBED=1 \
  CARES_EMBED=1 \
  CYTHON=cython \
  PYTHON=python \
  python setup.py build
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

  msg 'Installing...'
  python setup.py install -O1 --root="$pkgdir"
}
