# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: perlawk <perlawk@yahoo.com.hk>
# Contributor: xantares <xantares09@hotmail.com>

pkgname=asmjit-git
pkgver=r102.d7fc62d
pkgrel=1
pkgdesc='Complete x86/x64 JIT and Remote Assembler for C++'
arch=('i686' 'x86_64')
url='https://github.com/kobalicek/asmjit'
license=('custom')
depends=('gcc-libs')
makedepends=('cmake' 'git')
source=("git+https://github.com/kobalicek/asmjit.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd ${pkgname%-*}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package () {
  cd ${pkgname%-*}/build

  make install DESTDIR="$pkgdir"

  install -dm 755 "${pkgdir}"/usr/share/licenses/${pkgname}
  install -m 644 ../LICENSE.md "${pkgdir}"/usr/share/licenses/${pkgname}
}

# vim: ts=2 sw=2 et:
