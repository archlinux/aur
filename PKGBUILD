# Maintainer: Max Rossmannek <max@rossmannek.de>
# Contributor: Cullen Ross <cullenrss@gmail.com>

pkgname=cobib
pkgver=5.3.0
pkgrel=1
pkgdesc="Console Bibliography"
arch=('any')
license=('MIT')
provides=('cobib')
conflicts=('cobib')
url="https://gitlab.com/cobib/${pkgname}"
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=('python' 'python-bibtexparser' 'python-beautifulsoup4' 'python-lxml' 'python-ruamel-yaml' 'python-pylatexenc' 'python-requests' 'python-requests-oauthlib' 'python-text-unidecode' 'python-rich' 'python-textual' 'python-markdown-it-py' 'python-mdit_py_plugins' 'python-linkify-it-py')
optdepends=('python-regex')
source=("https://gitlab.com/cobib/cobib/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('592b3f088cb17b64cdfd5898d2ab93a671de4012e8f0ed41933cdcb0c3d5aa5e0fdfeb8f39237899767248bd5d24af935d6d5b0c55066b9c814560ca8b880565')

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
