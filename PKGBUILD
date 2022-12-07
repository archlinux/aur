# Maintainer: Julian Hauser <julian at julianhauser.com>
# PKGBUILD adapted from papis, maintained by JP-Ellis <josh@jpellis.me>

pkgname=papis-git
_pkgname=papis
pkgver=0.11.1.r22.g5599763
pkgrel=1
pkgdesc="A powerful and highly extensible command-line document and bibliography manager. Git version."
arch=('any')
url="https://github.com/papis/papis"
license=('GPL')
makedepends=('git')
depends=('python'
         'python-requests'
         'python-filetype'
         'python-pyparsing'
         'python-arxiv2bib'
         'python-pyaml'
         'python-chardet'
         'python-beautifulsoup4'
         'python-colorama'
         'python-bibtexparser'
         'python-click'
         'python-habanero'
         'python-isbnlib'
         'python-prompt_toolkit'
         'python-tqdm'
         'python-pygments'
         'python-stevedore'
         'python-doi'
         'python-typing_extensions'
         'python-lxml'
         'python-slugify'
         'python-dominate'
        )
optdepends=('papis-rofi: integration with rofi' 'papis-zotero: imports from zotero' 'python-whoosh: whoosh database backend' 'python-jinja: jinja formatting' 'fzf: fzf picker')
provides=("papis")
conflicts=("papis")
source=("git+https://github.com/papis/papis.git")
sha256sums=('SKIP')
noextract=()

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  sed -i '/configparser/d' setup.py
  python setup.py build
}

package() {
  cd "${_pkgname}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
