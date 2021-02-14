# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Daniele Marinello <m2346zc5-aur@yahoo.it>

pkgname=amule-emc
pkgver=0.5.2
pkgrel=1
pkgdesc="Multi-platform emulecollection parser written in C++"
arch=('x86_64')
url='http://code.google.com/p/amule-emc'
depends=('gcc-libs')
license=('GPL')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/amule-emc/amule-emc-${pkgver}.tar.gz"
        'amule-emc_0.5.2-2.diff'
        )
sha256sums=('7f287674b669cffeb41ae5f9dae9cedf827de199e40cf92a76cd9b60313b8927'
            '974753d17ea9e0799be4f5138df66be064acaef25295e798264854f28151666e'
            )

prepare() {
  mkdir -p build

  patch -d "amule-emc-${pkgver}" -p0 -i "${srcdir}/amule-emc_0.5.2-2.diff"
}

build() {

  cd build
  ../"amule-emc-${pkgver}"/configure \
    --prefix=/usr

  make
}
package() {
  make -C build DESTDIR="${pkgdir}" install
}

