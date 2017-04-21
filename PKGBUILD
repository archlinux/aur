# Maintainer: James Barnett < james at wbarnett dot us >

pkgname=avogadroapp
pkgver=1.90.0
pkgrel=1
pkgdesc="An advanced molecular editor designed for cross-platform use in
computational chemistry, molecular modeling, bioinformatics, materials science,
and related areas."
arch=('i686' 'x86_64')
url="http://www.openchemistry.org/projects/avogadro2/"
license=('GPL2')
depends=('avogadrolibs' 'hdf5')
optdepends=('openbabel: Open Babel plugin actions')
makedepends=('cmake' 'eigen')
source=("https://github.com/OpenChemistry/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('7842cedb642f2a153f80b1b10985f80067068b6fc3aca9d872002b3826b3b074390a7186e0857cd65df4747b34e9b359cdae19aad494ddd6bd31490a1dc3f667')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "${srcdir}/${pkgname}-${pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
