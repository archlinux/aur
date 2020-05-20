# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=papis
pkgver=0.10
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
        )
optdepends=('papis-rofi: integration with rofi')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "b8ce11c08dc32051545e73e858f0cd044ac12ef2.patch")
sha256sums=('0668bba24c0ea159fd9f3497f8f26b1e27e8bc9d9f9a52c82ef28835ee4ec4d1'
            '261f466e0a1765621877eef3b2b6498a2e54576d52b6fac66e52b7322d0d5608')
noextract=()

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p 1 < "${srcdir}/b8ce11c08dc32051545e73e858f0cd044ac12ef2.patch"
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
