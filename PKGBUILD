# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=papis
pkgver=0.11.1
pkgrel=1
pkgdesc="Papis is a powerful and highly extensible command-line based document and bibliography manager."
arch=('any')
url="https://github.com/papis/papis"
license=('GPL')
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
        )
optdepends=('papis-rofi: integration with rofi')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "isbnlib-3.10-fix.patch")
sha256sums=('e54739a1771ba4da4afe30b0b52dfc220543926765f975d14e8ddce508f4fdf9'
            '3f79cc4c5deb31cd56590b2c17e3d7a22fefd18e03580139ad665154b814fa10')
noextract=()

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p 1 < "${srcdir}/isbnlib-3.10-fix.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i '/configparser/d' setup.py
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
