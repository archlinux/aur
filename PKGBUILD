# Maintainer: Max Rossmannek <max@rossmannek.de>
# Contributor: Cullen Ross <cullenrss@gmail.com>

pkgname=cobib
pkgver=5.2.1
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
sha512sums=('c99a1f6631109db2474c7e839d98a4fe7cb1703d8a45858a799d43dff8de05f0e3e86aba404b307442227b2b2005d61cc5711c2b9e69d1d3fc8174e447001f10')

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
