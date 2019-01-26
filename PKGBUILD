# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Diogo Leal <estranho@diogoleal.com>

pkgname=arc
pkgver=5.21p
pkgrel=4
pkgdesc="Arc file archiver and compressor. Long since superceeded by zip/unzip but useful if have old .arc files need to unpack."
arch=('x86_64')
url='http://sourceforge.net/projects/arc'
license=('GPL')
source=("http://download.sourceforge.net/arc/arc-${pkgver}.tar.gz"
        'arc-5.21p-directory-traversel.patch::https://bugs.debian.org/cgi-bin/bugreport.cgi?att=1;bug=774527;filename=arc-5.21p-directory-traversel.patch;msg=10'
        'arc-5.21p-fix-arcdie.patch::https://bugs.debian.org/cgi-bin/bugreport.cgi?att=2;bug=774527;filename=arc-5.21p-fix-arcdie.patch;msg=10'
        'arc-5.21p-hdrv1-read-fix.patch::https://bugs.debian.org/cgi-bin/bugreport.cgi?att=3;bug=774527;filename=arc-5.21p-hdrv1-read-fix.patch;msg=10'
        )
sha256sums=('eacf870a245f155a4ba8c6f8e0fbb2e8a267aafa157f56ba7a8cb1d74fd8b5a1'
            'a2b96695d5714c7c74d47809e01eded3d95c31dc9b435de47cb3c8f4693f0cb4'
            'bcaa49fae5c139792e8a7117c03c357e0cfc135844f31fcb7c2cbdd8bf407a5e'
            'b7d4adbb6b32c46929a6f69a53d983449276d0ffcc59d4ce53cde0a1939accd6'
            )

prepare() {
  patch -d "arc-${pkgver}" -p1 -i "${srcdir}/arc-5.21p-hdrv1-read-fix.patch"
  patch -d "arc-${pkgver}" -p1 -i "${srcdir}/arc-5.21p-fix-arcdie.patch"
  patch -d "arc-${pkgver}" -p1 -i "${srcdir}/arc-5.21p-directory-traversel.patch"
}

build() {
  make -C "arc-${pkgver}"
}

package() {
  make -C "arc-${pkgver}" PREFIX=/usr DESTDIR="${pkgdir}" install
}
