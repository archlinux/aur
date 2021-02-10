# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=dwarftherapist
pkgver=41.2.1
pkgrel=1
pkgdesc="Heavily modified version of the original Dwarf Therapist."
url="https://github.com/Dwarf-Therapist/Dwarf-Therapist"
arch=('x86_64' 'i686')
license=('MIT')
depends=('qt5-declarative' 'hicolor-icon-theme' 'libcap')
makedepends=('cmake')
install="dwarftherapist.install"
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
md5sums=('b8be29a8644493374dbd8e316cf054c5')
sha256sums=('ec954daff6e03d9d44153ed3df90685de3a7a07431fd47639d83b2f5b3f62e4b')

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
