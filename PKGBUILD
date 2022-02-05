#  Maintainer: Blair Bonnett <blair dot bonnett at gmail>
# Contributor: Clayton Craft <clayton@craftyguy.net>

pkgname=python-pudb-git
_pkgname=pudb
pkgver=v2022.1.r7.gadb6276
pkgrel=1
pkgdesc="A full-screen, console-based Python debugger"
url="https://documen.tician.de/pudb/"
arch=('any')
license=('MIT')
depends=('python-jedi' 'python-packaging' 'python-pygments' 'python-urwid' 'python-urwid_readline')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-mock')
optdepends=(
  'bpython: bpython shell'
  'ptpython: shell based on prompt_toolkit'
  'ipython: shell embedding IPython'
)
provides=('python-pudb')
conflicts=('python-pudb')

source=("git+https://github.com/inducer/pudb.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/"$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/"$_pkgname"
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname"
  PYTHONPATH=build/lib PYTHONDONTWRITEBYTECODE=1 pytest -v
}

package() {
  cd "$srcdir"/"$_pkgname"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim: set ft=sh ts=2 sw=2 et:
