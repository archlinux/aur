# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: Nerdy Espeon <nerdyespeon@gmail.com>
# Contributor: Kirill A. Shutemov <kirill+arch@shutemov.name>

pkgname=dwarftherapist-git
epoch=1
pkgver=31.0.0_14_g4e6c78e
pkgrel=1
pkgdesc="Heavily modified version of the original Dwarf Therapist."
url="https://github.com/splintermind/Dwarf-Therapist"
arch=('x86_64' 'i686')
license=('MIT')
depends=('qt5-declarative' 'hicolor-icon-theme')
makedepends=('git' 'texlive-latexextra')
install="dwarftherapist.install"
source=($pkgname::git+https://github.com/splintermind/Dwarf-Therapist.git
       'dwarftherapist.desktop'
       'dwarftherapist.install')
md5sums=('SKIP'
         '32c80fd6e3b86900c1677b4e2859b07b'
         'caae1175c3bb8104bdc9e3014e648e57')

pkgver() {
  cd $pkgname
  git describe --tags | sed -e 's:v::' -e 's/-/_/g'
}

build() {
  cd $pkgname
  qmake -qt=5 PREFIX=/usr
  make
}

package() {
  cd $pkgname
  make INSTALL_ROOT="$pkgdir" install
  rm "$pkgdir/usr/bin/dwarftherapist"
  mv "$pkgdir/usr/bin/DwarfTherapist" "$pkgdir/usr/bin/dwarftherapist"
  install -Dm644 "$srcdir/dwarftherapist.desktop" \
    "$pkgdir"/usr/share/applications/dwarftherapist.desktop
  install -Dm644 resources/img/hammer.png \
    "$pkgdir"/usr/share/icons/hicolor/128x128/apps/dwarftherapist.png
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "doc/Dwarf Therapist.pdf" \
    "$pkgdir/usr/share/doc/dwarftherapist/Dwarf Therapist.pdf"
}

# vim:set ts=2 sw=2 et:
