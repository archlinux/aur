# Maintainer: Max Rossmannek <max.rossmannek@uzh.ch>
# Contributor: Cullen Ross <cullenrss@gmail.com>

_pkgname='cobib'
pkgname="${_pkgname}-git"
pkgver=r517.c6d4f59
pkgrel=1
arch=('any')
depends=('python' 'python-bibtexparser' 'python-beautifulsoup4' 'python-ruamel-yaml' 'python-pylatexenc' 'python-requests' 'python-rich' 'python-textual-git' 'python-markdown-it-py' 'python-mdit_py_plugins')
license=('MIT')
makedepends=('git')
provides=('cobib')
conflicts=('cobib')
pkgdesc="Console Bibliography"
url="https://gitlab.com/mrossinek/${_pkgname}"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/${_pkgname}
  python3 setup.py build
}

package() {
  cd $srcdir/${_pkgname}
  make DESTDIR="${pkgdir}" install_extras
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

