# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=todoman-git
_pkgname=todoman
pkgver=latest
pkgrel=6
pkgdesc="A simple CalDav-based todo manager."
arch=("any")
url="https://github.com/pimutils/todoman"
license=('MIT')
depends=(python-icalendar python-urwid python-xdg python-ansi
         python-parsedatetime python-atomicwrites python-click
         python-setuptools-scm)
optdepends=('python-click-repl-git: the repl command.')
checkdepends=('python-pytest' 'python-hypothesis')
conflicts=("todoman")
provides=("todoman")
source=(git+https://github.com/pimutils/todoman.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  python setup.py --version
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname"

  export PYTHONPATH=$(pwd)
  py.test
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir"
  install -Dm 644 todoman.conf.sample \
    "$pkgdir/usr/share/doc/todoman/examples/todoman.conf"
}
