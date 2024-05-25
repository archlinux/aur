# Maintainer: Max Rossmannek <max@rossmannek.de>
# Contributor: Cullen Ross <cullenrss@gmail.com>

_pkgname='cobib'
pkgname="${_pkgname}-git"
pkgver=r888.b08e6ba
pkgrel=1
arch=('any')
depends=('python' 'python-bibtexparser' 'python-beautifulsoup4' 'python-lxml' 'python-ruamel-yaml' 'python-pylatexenc' 'python-requests' 'python-requests-oauthlib' 'python-text-unidecode' 'python-rich' 'python-textual' 'python-markdown-it-py' 'python-mdit_py_plugins' 'python-linkify-it-py')
optdepends=('python-regex')
license=('MIT')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
provides=('cobib')
conflicts=('cobib')
pkgdesc="Console Bibliography"
url="https://gitlab.com/cobib/${_pkgname}"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/${_pkgname}
  python3 -m build --wheel --no-isolation
}

package() {
  cd $srcdir/${_pkgname}
  make DESTDIR="${pkgdir}" install_extras
  python3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
