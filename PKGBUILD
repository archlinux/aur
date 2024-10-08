# Maintainer: Alexander Chudnikov <gi-00001@redline-software.xyz>

pkgname=libakrypt
pkgver=0.9.15
pkgrel=1
pkgdesc="C library implementing key management and Russian national cryptographic standards. It aims to provide an open-source module for cryptographic protection systems, compliant with standard Р 1323565.1.012-2017."
arch=('x86_32' 'x86_64' 'aarmv7' 'mips' 'mips64')
url="https://libakrypt.ru/"
license=('MIT')
depends=('gcc' 'make' 'cmake' 'git')
source=("$pkgname::git+https://git.miem.hse.ru/axelkenzo/libakrypt-0.x.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  _head_ver=$(grep -oP '(?<=set\( HEAD_VERSION )\d+' CMakeLists.txt)
  _main_ver=$(grep -oP '(?<=set\( MAIN_VERSION )\d+' CMakeLists.txt)
  _minor_ver=$(grep -oP '(?<=set\( MINOR_VERSION )\d+' CMakeLists.txt)

  printf '%s.%s.%s' "${_head_ver:?}" "${_main_ver:?}" "${_minor_ver:?}"
}

build() {
  cmake -S ./$pkgname -B ./$pkgname/build/ -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build ./$pkgname/build
}

package() {
  DESTDIR="$pkgdir" cmake --install ./$pkgname/build/
}
