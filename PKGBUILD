# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=dwarftherapist
pkgver=39.2.0
pkgrel=1
pkgdesc="Heavily modified version of the original Dwarf Therapist."
url="https://github.com/Dwarf-Therapist/Dwarf-Therapist"
arch=('x86_64' 'i686')
license=('MIT')
depends=('qt5-declarative' 'hicolor-icon-theme' 'libcap')
makedepends=('cmake')
install="dwarftherapist.install"
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
md5sums=('adee70c7ffed5f2af5af7d3a1d9cffc0')
sha256sums=('7ac1bcb2835127aa4c1c38ba08e32dcfb66b8363125ac1a985ce1624d803c7aa')

build() {
  cd Dwarf-Therapist-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE="Release" .
  make
}

package() {
  cd Dwarf-Therapist-${pkgver}
  make DESTDIR="${pkgdir}" install
  
  # Rename binary
  mv "${pkgdir}/usr/bin/DwarfTherapist" "${pkgdir}/usr/bin/dwarftherapist"
  # Fix .desktop
  sed -i 's:DwarfTherapist:dwarftherapist:g' "${pkgdir}/usr/share/applications/dwarftherapist.desktop"

  # Link license to expected location
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/share/doc/dwarftherapist/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
