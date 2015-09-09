# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jakub Kozisek <nodevel at gmail dot com>

set -u
pkgname='pdfreflow'
pkgver='0.8.6'
pkgrel='1'
pkgdesc='operates on the output of pdftohtml and reflows the texts into paragraphs.'
arch=('i686' 'x86_64')
url='http://pdfreflow.sourceforge.net/'
license=('GPLv3')
makedepends=('gcc')
optdepends=('pdftohtml: for converting PDF files into HTML and XML formats')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}.tgz")
sha256sums=('b7bb103b7a3fd01db6c2220d13def2e833f5184ccecdcb187e67ae0c0914b7f7')

prepare() {
  set -u
  cd "${pkgname}-${pkgver}"
  ./configure --prefix='/usr'
  set +u
}

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  make -s -j "$(nproc)"
  set +u
}

check() {
  set -u
  cd "${pkgname}-${pkgver}"
  cd 'test'
  ./doit.sh
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  set +u
}
set +u
