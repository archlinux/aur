# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=todoman
pkgver=1.6.3
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
source=("https://pypi.io/packages/source/t/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('08c3a798d800a12e270ae6706352db8f')

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
