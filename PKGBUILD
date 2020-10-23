# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Diogo Leal <estranho@diogoleal.com>

pkgname=arc
pkgver=5.21p
pkgrel=5
pkgdesc="Arc file archiver and compressor. Long since superceeded by zip/unzip but useful if have old .arc files need to unpack."
arch=('x86_64')
url='http://sourceforge.net/projects/arc'
license=('GPL')
source=("http://download.sourceforge.net/arc/arc-${pkgver}.tar.gz"
        'arc-5.21p-directory-traversel.patch::https://salsa.debian.org/debian/arc/-/raw/debian/master/debian/patches/080_arc-5.21p-directory-traversel.patch'
        'arc-5.21p-fix-arcdie.patch::https://salsa.debian.org/debian/arc/-/raw/debian/master/debian/patches/070_arc-5.21p-fix-arcdie.patch'
        'arc-5.21p-hdrv1-read-fix.patch::https://salsa.debian.org/debian/arc/-/raw/debian/master/debian/patches/060_arc-5.21p-hdrv1-read-fix.patch'
        'https://gitweb.gentoo.org/repo/gentoo.git/plain/app-arch/arc/files/arc-5.21p-fno-common.patch'
        'fix-gcc-warnings.patch::https://salsa.debian.org/debian/arc/-/raw/debian/master/debian/patches/040_fix-gcc-warnings.patch'
        )
sha256sums=('eacf870a245f155a4ba8c6f8e0fbb2e8a267aafa157f56ba7a8cb1d74fd8b5a1'
            '3ec0bf53d40dbe2e05a6dd37ec5ed882aa78cdee36adda6b3829c1534dea9b79'
            '9af0ba3e6f4ab8a70101aafe412dc8680013ad2d086340d2200611a1442e16b0'
            '45be47184902c31a0f17268ff4dd2acc83f47fef3567edffcab8b418bd61b121'
            'aa80eea84d635a79565870fe076d4487e4b8770d9e065b54428e852a39ef3e40'
            'ac902db9fbadda9a917bb06ea4e13f8ef086116e882f5b13d680e4099fa52fca'
            )

prepare() {
  patch -d "arc-${pkgver}" -p1 -i "${srcdir}/arc-5.21p-hdrv1-read-fix.patch"
  patch -d "arc-${pkgver}" -p1 -i "${srcdir}/arc-5.21p-fix-arcdie.patch"
  patch -d "arc-${pkgver}" -p1 -i "${srcdir}/arc-5.21p-directory-traversel.patch"
  patch -d "arc-${pkgver}" -p1 -i "${srcdir}/arc-5.21p-fno-common.patch"
  patch -d "arc-${pkgver}" -p1 -i "${srcdir}/fix-gcc-warnings.patch"
}

build() {
  make -C "arc-${pkgver}"
}

package() {
  make -C "arc-${pkgver}" PREFIX=/usr DESTDIR="${pkgdir}" install
}
