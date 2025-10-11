# Maintainer: Max Rossmannek <max@rossmannek.de>
# Contributor: Cullen Ross <cullenrss@gmail.com>

pkgname=cobib
pkgver=5.5.5
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
sha512sums=('7241519fe285459d2bd9a16ccfc245f22c157826790f60f99882010b56a1f13f1080718412a8438dc30a788434e76db609eb87fbbbad86ce7a226861946f05a8')

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
