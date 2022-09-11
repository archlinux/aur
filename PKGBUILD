# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Diogo Leal <estranho@diogoleal.com>

pkgname=arc
pkgver=5.21q
pkgrel=1
pkgdesc="Arc file archiver and compressor. Long since superceeded by zip/unzip but useful if have old .arc files need to unpack."
arch=('x86_64')
url='http://sourceforge.net/projects/arc'
license=('GPL')
source=("https://github.com/ani6al/arc/archive/refs/tags/$pkgver.tar.gz" # "http://download.sourceforge.net/arc/arc-${pkgver}.tar.gz"
        'arc-5.21q-fix-makefile.patch::https://salsa.debian.org/debian/arc/-/raw/debian/master/debian/patches/010_fix-makefile.patch'
        'arc-5.21q-spelling.patch::https://salsa.debian.org/debian/arc/-/raw/debian/master/debian/patches/020_spelling.patch'
        'arc-5.21q-manpage-section-fix.patch::https://salsa.debian.org/debian/arc/-/raw/debian/master/debian/patches/030_manpage-section-fix.patch'
        'arc-5.21q-fix-gcc-warnings.patch::https://salsa.debian.org/debian/arc/-/raw/debian/master/debian/patches/040_fix-gcc-warnings.patch'
        'arc-5.21q-nostrip.patch::https://salsa.debian.org/debian/arc/-/raw/debian/master/debian/patches/050_nostrip.patch'
        'arc-5.21q-hdrv1-read-fix.patch::https://salsa.debian.org/debian/arc/-/raw/debian/master/debian/patches/060_arc-5.21p-hdrv1-read-fix.patch'
        'arc-5.21q-fix-arcdie.patch::https://salsa.debian.org/debian/arc/-/raw/debian/master/debian/patches/070_arc-5.21p-fix-arcdie.patch'
        'arc-5.21q-directory-traversel.patch::https://salsa.debian.org/debian/arc/-/raw/debian/master/debian/patches/080_arc-5.21p-directory-traversel.patch'
        'arc-5.21q-fno-common.patch::https://gitweb.gentoo.org/repo/gentoo.git/plain/app-arch/arc/files/arc-5.21p-fno-common.patch'
        )
sha256sums=('bde44648d0c451852612da2256f5a7e48b97d0d625ba88b903d7f223959528cc'
            '219735abda0425ffcb9602711276a5562033df01360050768a4754ec772b840d'
            '921cf195cb3513837816aff759271ae9be48b026f312b82eb595b2289afbcc61'
            'b344d7e8f6f7168fd32ddf9cf00834c8290e90673b9b49e94b2d84c8296f27d6'
            'ac902db9fbadda9a917bb06ea4e13f8ef086116e882f5b13d680e4099fa52fca'
            '13fd922a4097e384eda9d25d93dfd6832f9c7bfd80b09b5d5a2a15ad6fa42488'
            '45be47184902c31a0f17268ff4dd2acc83f47fef3567edffcab8b418bd61b121'
            '9af0ba3e6f4ab8a70101aafe412dc8680013ad2d086340d2200611a1442e16b0'
            '3ec0bf53d40dbe2e05a6dd37ec5ed882aa78cdee36adda6b3829c1534dea9b79'
            'aa80eea84d635a79565870fe076d4487e4b8770d9e065b54428e852a39ef3e40'
            )

prepare() {
  patch -d "arc-${pkgver}" -p1 -i "${srcdir}/arc-5.21q-fix-makefile.patch"
  patch -d "arc-${pkgver}" -p1 -i "${srcdir}/arc-5.21q-spelling.patch"
  patch -d "arc-${pkgver}" -p1 -i "${srcdir}/arc-5.21q-manpage-section-fix.patch"
  patch -d "arc-${pkgver}" -p1 -i "${srcdir}/arc-5.21q-fix-gcc-warnings.patch"
  patch -d "arc-${pkgver}" -p1 -i "${srcdir}/arc-5.21q-nostrip.patch"
  patch -d "arc-${pkgver}" -p1 -i "${srcdir}/arc-5.21q-hdrv1-read-fix.patch"
  patch -d "arc-${pkgver}" -p1 -i "${srcdir}/arc-5.21q-fix-arcdie.patch"
  patch -d "arc-${pkgver}" -p1 -i "${srcdir}/arc-5.21q-directory-traversel.patch"
  patch -d "arc-${pkgver}" -p1 -i "${srcdir}/arc-5.21q-fno-common.patch"
}

build() {
  make -C "arc-${pkgver}"
}

package() {
  make -C "arc-${pkgver}" PREFIX=/usr DESTDIR="${pkgdir}" install
}
