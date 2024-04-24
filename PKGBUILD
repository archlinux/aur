# Maintainer: Fabrix Xm <fabrix.xm@gmail.com>
pkgname=lesana
pkgver=0.10.1
pkgrel=2
pkgdesc="Manage collection inventories throught yaml files, develop version"
arch=('any')
url="https://lesana.trueelena.org/"
license=(AGPL-3.0-or-later)
depends=('python' 'python-dateutil' 'python-jinja' 'python-ruamel-yaml' 'python-xapian' 'python-setuptools' 'python-hazwaz')
optdepends=(
    'python-argcomplete: enable commandline tab completion'
    'git: git integration'
    'sh: git integration'
    'python-gitpython: git integration'
) 
makedepends=(python-build python-installer python-wheel)
source=("https://git.sr.ht/~valhalla/$pkgname/archive/v$pkgver.tar.gz" pyproject.toml.patch)
sha256sums=('9e858cc10ba57132f10b16ecf32f54f8a0dc96783bf0283473340db4536c2e25'
            '0db3be7a5e6d0246fbc90dd0fc61c5d765cea49c03133c2a6ce4224ec1d6d2f5')


prepare() {
    cd "${pkgname}-v${pkgver}"
    rm -fr dist/*.whl
    # patch pyproject to not require setuptools-scm to get version
    patch --forward --strip=1 --input=../pyproject.toml.patch
}

build() {
  cd "${pkgname}-v${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-v${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
