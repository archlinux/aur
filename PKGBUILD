# Maintainer: Max Rossmannek <max@rossmannek.de>
# Contributor: Cullen Ross <cullenrss@gmail.com>

pkgname=cobib
pkgver=6.0.3
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
sha512sums=('51502e0c4fbcff282a1a1f62c15b91a8ab3d0b237a4208d43a4694d0c31ae58dde2f08596a4504aacc2e568fb693cefa3c793a24d38f4a61c3014911e2d90fb6')

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
