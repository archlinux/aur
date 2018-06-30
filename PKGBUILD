# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=mothur
pkgver=1.40.5
pkgrel=1
pkgdesc='A bioinformatics program for analyzing microbial communities.'
arch=('x86_64')
url='https://www.mothur.org/'
license=('GPL3')
depends=('boost-libs')
makedepends=('boost')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a0fbdfa68b966d7adc4560e3787506a0dad8b47b4b996c2663cd6c0b416d101a')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -e 's|BOOST_LIBRARY_DIR="\\"Enter_your_boost_library_path_here\\""|BOOST_LIBRARY_DIR = /usr/lib|' \
      -e 's|BOOST_INCLUDE_DIR="\\"Enter_your_boost_include_path_here\\""|BOOST_INCLUDE_DIR = /usr/include|' \
      -i Makefile
}

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 mothur "${pkgdir}/usr/bin/mothur"
  install -Dm755 uchime "${pkgdir}/usr/bin/uchime"
}
