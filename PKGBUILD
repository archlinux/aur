# Maintainer: Martin Thierer <thierer@web.de>

pkgname=cc1541
pkgver=4.2
pkgrel=1
pkgdesc='Tool for creating .d64 images with custom sector interleaving etc.'
arch=('x86_64')
url='https://bitbucket.org/PTV_Claus/cc1541/src/master/'
license=('custom')
makedepends=('asciidoc')
source=("https://bitbucket.org/PTV_Claus/cc1541/downloads/cc1541-${pkgver}.zip"
	"asciidoc.patch")

md5sums=('f0e43a1150c70d2dec934afa36a9919f'
         'e4b27bce96d40cfd55c5fe63c8f12cd6')

prepare() {
  patch -Np1 -d "${pkgname}-${pkgver}" -i "${srcdir}/asciidoc.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make cc1541 man
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -D -m755 -t ${pkgdir}/usr/bin/ cc1541
  install -D -m644 -t ${pkgdir}/usr/share/doc/${pkgname}/ README.md
  install -D -m644 -t ${pkgdir}/usr/share/licenses/${pkgname}/ LICENSE.txt
  install -D -m644 -t ${pkgdir}/usr/share/man/man1/ cc1541.1
  install -D -m644 -t ${pkgdir}/usr/share/${pkgname}/ transwarp*.prg
}
