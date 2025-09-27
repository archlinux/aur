# Maintainer: Max Rossmannek <max@rossmannek.de>
# Contributor: Cullen Ross <cullenrss@gmail.com>

pkgname=cobib
pkgver=5.4.0
pkgrel=1
pkgdesc="Console Bibliography"
arch=('any')
license=('MIT')
provides=('cobib')
conflicts=('cobib')
url="https://gitlab.com/cobib/${pkgname}"
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'ruby-ronn-ng'
)
depends=(
    'python'
    'python-beautifulsoup4'
    'python-bibtexparser'
    'python-linkify-it-py'
    'python-lxml'
    'python-markdown-it-py'
    'python-mdit_py_plugins'
    'python-pylatexenc'
    'python-requests'
    'python-requests-oauthlib'
    'python-rich'
    'python-ruamel-yaml'
    'python-text-unidecode'
    'python-textual'
)
optdepends=(
    'python-regex'
)
source=("https://gitlab.com/cobib/cobib/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('0526f2cf0078eacae4355fcfbd943bf544d858e30d534a31e7da04cb97c466199486d22341f35d34b9b70da1129853b4806f884caac811803f28774339325e1f')

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
