# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=dwarftherapist
pkgver=42.1.21
pkgrel=1
pkgdesc="Dwarf management tool for Dwarf Fortress"
url="https://github.com/Dwarf-Therapist/Dwarf-Therapist"
arch=('x86_64' 'i686')
license=('MIT')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libcap' 'qt5-base' 'qt5-declarative')
makedepends=('cmake')
install="dwarftherapist.install"
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
md5sums=('4a62742070a8ecc92dacbd252ae311a5')
sha256sums=('654a3eedb805ec796440da2af9939960a77e20f6cb6fcc15f3d580db50a31bcb')

build() {
  cd Dwarf-Therapist-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX="/usr" .
  make
}

package() {
  cd Dwarf-Therapist-${pkgver}
  make DESTDIR="${pkgdir}" install
  
  # Link license to expected location
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/share/doc/dwarftherapist/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
