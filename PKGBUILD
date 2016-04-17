# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=todoman
pkgver=1.6.0
pkgrel=1
pkgdesc="A simple CalDav-based todo manager."
arch=("any")
url="https://github.com/pimutils/todoman"
license=('MIT')
depends=(python-icalendar python-urwid python-xdg python-ansi
         python-parsedatetime python-atomicwrites python-click
         python-setuptools-scm)
optdepends=('python-click-repl-git: the repl command.')
checkdepends=('python-pytest' 'python-hypothesis')
source=("https://pypi.python.org/packages/source/t/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('ef411ddfee02c2261e124af15699cac2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  export PYTHONPATH=$(pwd)
  py.test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir"
  install -Dm 644 todoman.conf.sample \
    "$pkgdir/usr/share/doc/todoman/examples/todoman.conf"
}
