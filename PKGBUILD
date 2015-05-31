# Maintainer: Robert Knauer <robert@privatdemail.net>
# Contributor: SID/sidious <miste78 at web.de> 

pkgname=freedoko
pkgver=0.7.12
pkgrel=1
pkgdesc="Free version of the german card game Doppelkopf"
arch=('i686' 'x86_64')
url="http://free-doko.sourceforge.net/en/FreeDoko.html"
license=('GPL')
depends=('gtkmm' 'gnet' 'freealut')
makedepends=('unzip')
conflicts=('freedoko-bin32')
install='freedoko.install'
source=(
  "http://downloads.sourceforge.net/free-doko/FreeDoko_${pkgver}.src.zip"
  'help.cpp.diff'
  'Makefile.diff'
  'Makefile.install.directories.diff'
)
sha256sums=(
  'ce81ad52c16b4c5d59366ef8624da1be59326bbb8e58a79efee1448d9f603685'
  '84d13d02548e42d9b9ebc41179bece4e98612565bbf133502713ee54e7716fcb'
  'bb46506282f10366703138bc1bd78c76cf75079fa0571b45161f4c1d38b43626'
  '3747cf13c8cf866e31a981061967b399adb37fea22b3b77791d76ea140faf735'
)

prepare() {
  cd "${srcdir}/FreeDoko_${pkgver}"
  patch -p0 < "${srcdir}/help.cpp.diff"
  patch -p0 < "${srcdir}/Makefile.diff"
  patch -p0 < "${srcdir}/Makefile.install.directories.diff"
}

build() {
  cd "${srcdir}/FreeDoko_${pkgver}"
  make compile
}

package() {
  cd "${srcdir}/FreeDoko_${pkgver}"
  make DESTDIR="${pkgdir}" install
}
