# Maintainer: Filipe Verri <filipeverri@gmail.com>

pkgname=libbpkg
pkgver=0.6.0
pkgrel=1
pkgdesc="build2 package manager library"
arch=(i686 x86_64)
url="https://build2.org/"
license=('MIT')
depends=('libbutl=0.6.0')
makedepends=('build2=0.6.0' 'gcc>=4.9')
source=("git+https://git.build2.org/libbpkg.git#tag=0.6.0")
md5sums=('SKIP')

build() {
  cd libbpkg

  b configure                          \
    config.cxx=g++                     \
    config.cc.coptions=-O3             \
    config.bin.lib=shared              \
    config.install.root="$pkgdir/usr"

  b
}

package() {
  cd libbpkg

  b install
  mv "$pkgdir/usr/lib/pkgconfig/libbpkg.shared.pc" "$pkgdir/usr/lib/pkgconfig/libbpkg.pc"
  sed -i 's/-[IL][^ ]*//g' "$pkgdir/usr/lib/pkgconfig/libbpkg.pc"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
