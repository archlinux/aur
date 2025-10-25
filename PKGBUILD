# Maintainer: Max Rossmannek <max@rossmannek.de>
# Contributor: Cullen Ross <cullenrss@gmail.com>

pkgname=cobib
pkgver=6.0.1
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
    'python-ruamel.yaml.clib'
)
license=('MIT')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
    'ruby-ronn-ng'
)
provides=('cobib')
conflicts=('cobib')
pkgdesc="Console Bibliography"
url="https://gitlab.com/cobib/${pkgname}"
source=("https://gitlab.com/cobib/cobib/-/releases/v$pkgver/downloads/$pkgname-v$pkgver.tar.gz")
sha512sums=('a695cb207ecb3fc3ab1c2cb455c72b3f6a6f7f1140d0e19743e761dec19f85105c15af81f8204fc7b871e40f3f050411222e69327f3c706bac2fc8821a1e2e0c')

build() {
  cd "${srcdir}"
  python3 -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}"
  make DESTDIR="${pkgdir}" install_extras
  python3 -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
