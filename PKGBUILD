# Maintainer: crave <crave@infinity>

pkgname=fstar-ulib
pkgver=0.9.6.0
pkgrel=9
pkgdesc="compiles the ulib component of F*"
arch=('i686' 'x86_64')
url='https://www.fstar-lang.org/'
license=('Apache-2.0')
options=('!strip' '!makeflags' 'staticlibs')
depends=('fstar' 'z3' 'ocaml-fstar')

build() {
  cd "$srcdir/"
  cp -r /opt/fstar/ .
  export FSTAR_HOME="$(pwd)/fstar"
  cd fstar/ulib
  make clean
  cd ml
  make clean
  make -j4
}

package() {
  cd "$srcdir/"
  mkdir -p "$pkgdir/opt/fstar/ulib"
  find fstar/ulib -type f -exec sh -c "pacman -Ql fstar | cut -f 2 -d ' ' | grep -q '{}$' || cp -r {} '$pkgdir/opt/fstar/ulib'" \;
}
