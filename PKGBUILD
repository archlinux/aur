# Maintainer:  JP-Ellis <josh@jpellis.me>
pkgname=papis
pkgver=0.9
pkgrel=2
pkgdesc="Papis is a powerful and highly extensible command-line based document and bibliography manager."
arch=('any')
url="https://github.com/papis/papis"
license=('GPL')
depends=('python'
         'python-arxiv2bib'
         'python-beautifulsoup4'
         'python-bibtexparser'
         'python-chardet'
         'python-click'
         'python-colorama'
         'python-doi'
         'python-filetype'
         'python-habanero'
         'python-isbnlib'
         'python-lxml'
         'python-prompt_toolkit'
         'python-pyaml'
         'python-pygments'
         'python-pylibgen'
         'python-pyparsing'
         'python-requests'
         'python-slugify'
         'python-tqdm'
        )
optdepends=('papis-rofi: integration with rofi')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "bfe0ffae835dc5769198ae4aa5625ce44076eeb7.patch"
        "73e740b17d47e3ccddc72b58221f21a431b49d46.patch")
sha256sums=('6a1070ea9a8345dde9cb5d9ccda582e2592520f987d0cfefa6f95d714bf5fd42'
            '90534a40b12bcf3cc206ee11737fdb0bdf21cc6b56405ee9a8363a5a83b8e5fc'
            '0f49015e96084fa6e978d69d695133a9753bd914fa0eb5bb1a7ee7348182fc7d')
noextract=()

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p 1 -i "${srcdir}/bfe0ffae835dc5769198ae4aa5625ce44076eeb7.patch"
  patch -p 1 -i "${srcdir}/73e740b17d47e3ccddc72b58221f21a431b49d46.patch"
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
