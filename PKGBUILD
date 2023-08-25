# Maintainer: Chan Beom Park <cbpark@gmail.com>

pkgname=softsusy
pkgver=4.1.20
pkgrel=1
pkgdesc="This program provides a SUSY spectrum in the NMSSM, or the MSSM including flavour violation and with or without R-parity consistent with input Standard Model fermion mass/mixings and electroweak/strong coupling data."
arch=("x86_64")
url="https://ballanach.github.io/softsusy/"
license=('GPL')
makedepends=("autoconf")
depends=("gcc-libs" "gcc-fortran")
source=("https://raw.githubusercontent.com/BAllanach/softsusy/master/tags/${pkgname}-${pkgver}.tar.gz"
        "remove_duplicate_header.patch"
        "remove_install_data_local.patch")
sha256sums=('3244ae3db8b2309ebabbdfd88e9b3e4760d02b68ee011fb7710b3d9198be74e4'
            '363e0537caf14b340d1d1308f768e314f0b14a90455c4ba4eaa2fd41884c369b'
            '5a58edaa0a73a594d7f9758135f0ce10e7cb01c2d6f2a1b08b37237fc5b12263')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 -i "${srcdir}/remove_duplicate_header.patch"
  patch -p1 -i "${srcdir}/remove_install_data_local.patch"
  autoreconf -i
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr \
              --enable-shared=yes \
              --enable-static=no
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
