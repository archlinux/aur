# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=krakatau-git
pkgver=r535.53bb6e6
pkgrel=1
pkgdesc="Java decompiler, assembler, and disassembler"
arch=('any')
url="https://github.com/Storyyeller/Krakatau"
license=('GPL3')
depends=('python2')
optdepends=('python2-ply: Assembly support'
            'pypy: Better performance')
source=("git+https://github.com/Storyyeller/Krakatau.git#branch=master"
        "krakatau-assemble"
        "krakatau-disassemble"
        "krakatau-decompile")
sha256sums=('SKIP'
            'c8b367cffe846965a7d14641f079122a66b35ea81e6c4cc8f6658e59973a0c82'
            'c5a8d21c4625b47762f91e98cb4084563f1e7021eb231d780cb72c08893235d1'
            'c8d60fc37120e0bde9111591c7445abc5dfb5457671679555b2fc2dae3eb17e8')

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
