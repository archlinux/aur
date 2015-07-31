# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=krakatau-git
pkgver=r332.71b4276
pkgrel=1
pkgdesc="Java decompiler, assembler, and disassembler"
arch=('any')
url="https://github.com/Storyyeller/Krakatau"
license=('GPL3')
depends=('python2')
optdepends=('python2-ply: Assembly support')
source=("git+https://github.com/Storyyeller/Krakatau.git"
        "krakatau-assemble"
        "krakatau-disassemble"
        "krakatau-decompile")
sha256sums=('SKIP'
            '7f3a1fc32030b51e21e317b9054073d1e0b4a56bdf1798182239caba174a5025'
            'b69f03e8beb427cc0a1761106f0a9a2f07366ec5aae066095327ec462895db07'
            '6440b23414f3d90325eb38f270b9551a93765cea4169b393e79dee435e2efa90')

pkgver() {
  cd Krakatau
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd Krakatau

  python2 -O -m compileall -d /usr/share/krakatau .
}

package() {
  install -Dm755 krakatau-assemble "$pkgdir/usr/bin/krakatau-assemble"
  install -Dm755 krakatau-disassemble "$pkgdir/usr/bin/krakatau-disassemble"
  install -Dm755 krakatau-decompile "$pkgdir/usr/bin/krakatau-decompile"

  cd Krakatau

  install -d "$pkgdir/usr/share/krakatau"
  cp assemble.py* disassemble.py* decompile.py* "$pkgdir/usr/share/krakatau/"
  cp -r Krakatau "$pkgdir/usr/share/krakatau/"
}

# vim:set ts=2 sw=2 et:

