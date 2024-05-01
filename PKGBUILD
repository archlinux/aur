# Maintainer: Max Rossmannek <max@rossmannek.de>
# Contributor: Cullen Ross <cullenrss@gmail.com>

pkgname=cobib
pkgver=5.0.1
pkgrel=1
pkgdesc="Console Bibliography"
arch=('any')
license=('MIT')
provides=('cobib')
conflicts=('cobib')
url="https://gitlab.com/cobib/${pkgname}"
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('python' 'python-bibtexparser' 'python-beautifulsoup4' 'python-lxml' 'python-ruamel-yaml' 'python-pylatexenc' 'python-requests' 'python-requests-oauthlib' 'python-text-unidecode' 'python-rich' 'python-textual' 'python-markdown-it-py' 'python-mdit_py_plugins' 'python-linkify-it-py')
source=("https://gitlab.com/cobib/cobib/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('454c7bb10435af510c9379332ca46edfd014d698619674f9d24540e3175a1d1875733fb0a917213dfff803e4cdff9b93291801707e4f59a87a8c19ce7ebe228d')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  make DESTDIR="${pkgdir}" install_extras
  python3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
