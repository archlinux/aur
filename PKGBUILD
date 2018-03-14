# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=dwarftherapist
pkgver=39.2.1
pkgrel=1
pkgdesc="Heavily modified version of the original Dwarf Therapist."
url="https://github.com/Dwarf-Therapist/Dwarf-Therapist"
arch=('x86_64' 'i686')
license=('MIT')
depends=('qt5-declarative' 'hicolor-icon-theme' 'libcap')
makedepends=('cmake')
install="dwarftherapist.install"
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
md5sums=('eb9a2b523dd7c5de68dda1c1ad8ce9d8')
sha256sums=('5b2ea34b4514c2eed1941c7e9fc9be63a51aa1c5bacec4d1c2fde541426a8538')

build() {
  cd Dwarf-Therapist-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX="/usr" .
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
