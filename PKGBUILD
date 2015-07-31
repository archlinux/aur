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
            'aecd6fda224671ef2127ec2fe9cd804eb9128985c33a5e2034aa0c76234376df'
            '1caa7bdd1a62a714ee25218b98fd6193254c6afee13470a5b7fa84c92d57fb21'
            '155b3a71b7d31d85e9bbd8a86ba5471c7d2ba2c31b36d37410c241ecfd2c7ed2')

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

