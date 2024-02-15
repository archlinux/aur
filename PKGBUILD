# Contributor: Gesh <gesh@gesh.uni.cx>
# Maintainer: Julian Hauser <julian at julianhauser.com>
# PKGBUILD adapted from papis, maintained by JP-Ellis <josh@jpellis.me>

pkgname=papis-git
_pkgname=papis
pkgver=0.13.r328.g72dedcfa
pkgrel=1
pkgdesc="A powerful and highly extensible command-line document and bibliography manager. Git version."
arch=('any')
url="https://github.com/papis/papis"
license=('GPL-3.0+')
makedepends=('git')
depends=('python'
         'python-arxiv'
         'python-beautifulsoup4'
         'python-bibtexparser'
         'python-chardet'
         'python-click'
         'python-colorama'
         'python-doi'
         'python-dominate'
         'python-filetype'
         'python-habanero'
         'python-isbnlib'
         'python-lxml'
         'python-prompt_toolkit'
         'python-pyaml'
         'python-pygments'
         'python-pyparsing'
         'python-requests'
         'python-slugify'
         'python-stevedore'
         'python-tqdm'
         'python-typing_extensions'
        )
optdepends=(
    'fzf: fzf picker'
    'papis-rofi: integration with rofi'
    'papis-zotero: imports from zotero'
    'pdfjs: pdf reader in the web app'
    'python-jinja: jinja formatting'
    'python-whoosh: whoosh database backend'
)
checkdepends=(
    flake8
    mypy
    python-flake8-bugbear
    python-flake8-quotes
    python-pep8-naming
    python-pylint
    python-pytest
    python-types-beautifulsoup4
    python-types-pyaml
    python-types-pygments
    python-types-requests
    python-types-setuptools
    python-types-tqdm
    )
provides=("papis")
conflicts=("papis")
source=("git+https://github.com/papis/papis.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
  cd "${_pkgname}"
  python -m pytest papis tests
  python -m flake8 papis tests examples
  python -m mypy papis
}

build() {
  cd "${_pkgname}"
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
