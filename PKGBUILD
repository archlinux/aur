# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Nerdy Espeon <nerdyespeon@gmail.com>
# Contributor: Kirill A. Shutemov <kirill+arch@shutemov.name>

pkgname=dwarftherapist-git
epoch=2
pkgver=r1229.fd5d9a0
pkgrel=1
pkgdesc="Heavily modified version of the original Dwarf Therapist."
url="https://github.com/Hello71/Dwarf-Therapist"
arch=('x86_64' 'i686')
license=('MIT')
depends=('qt5-declarative' 'hicolor-icon-theme' 'libcap')
makedepends=('git' 'cmake')
install="dwarftherapist.install"
source=(git+"https://github.com/Hello71/Dwarf-Therapist.git#branch=DF2016")
md5sums=('SKIP')

pkgver() {
  cd Dwarf-Therapist
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd Dwarf-Therapist
}

build() {
  cd Dwarf-Therapist
  cmake -DCMAKE_PREFIX="/usr" -DCMAKE_BUILD_TYPE="Release" .
  make
}

package() {
  cd Dwarf-Therapist
  install -Dm755 "DwarfTherapist" "$pkgdir/usr/bin/dwarftherapist"
  install -dm755 "$pkgdir/usr/share/dwarftherapist/memory_layouts"
  cp -a share/memory_layouts/* "$pkgdir/usr/share/dwarftherapist/memory_layouts"
  install -Dm644 "dist/dwarftherapist.desktop" \
    "$pkgdir/usr/share/applications/dwarftherapist.desktop"
  install -Dm644 resources/img/hammer.png \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/dwarftherapist.png"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
