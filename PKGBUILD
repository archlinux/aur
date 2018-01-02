# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=todoman-git
_pkgname=todoman
pkgver=3.2.3.post21+gdc64bbd
pkgrel=1
pkgdesc="A simple CalDav-based todo manager."
arch=("any")
url="https://github.com/pimutils/todoman"
license=('MIT')
depends=(python-icalendar python-urwid python-xdg python-parsedatetime
         python-atomicwrites python-click python-setuptools-scm
         python-configobj python-dateutil python-tabulate python-humanize)
optdepends=('python-click-repl-git: the repl command.')
checkdepends=('python-pytest' 'python-hypothesis' 'python-pytest-runner'
              'python-freezegun' 'python-pytest-cov')
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

  export PYTHONPATH="${PYTHONPATH%:}:${PWD}"
  py.test
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm 644 todoman.conf.sample \
    "$pkgdir/usr/share/doc/todoman/examples/todoman.conf"

  install -Dm 755 bin/todo "$pkgdir/usr/bin/todo"
}
