# Maintainer: Max Rossmannek <max@rossmannek.de>
# Contributor: Cullen Ross <cullenrss@gmail.com>

pkgname=cobib
pkgver=6.0.0
pkgrel=1
arch=('any')
depends=(
    'python'
    'python-beautifulsoup4'
    'python-bibtexparser'
    'python-linkify-it-py'
    'python-lxml'
    'python-markdown-it-py'
    'python-mdit_py_plugins'
    'python-natsort'
    'python-pylatexenc'
    'python-requests'
    'python-requests-oauthlib'
    'python-rich'
    'python-ruamel-yaml'
    'python-text-unidecode'
    'python-textual'
)
optdepends=(
    'python-prompt_toolkit'
    'python-regex'
)
license=('MIT')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'ruby-ronn-ng'
)
provides=('cobib')
conflicts=('cobib')
pkgdesc="Console Bibliography"
url="https://gitlab.com/cobib/${pkgname}"
source=("https://gitlab.com/cobib/cobib/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('4a37eb42eaef3cc95a2125592c22690584c7e622df77c5ee753661f5dd89682c59a1f479bbd67135bc54ba38654f885e4750399b6a1e46143803ff75f03b71eb')

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
