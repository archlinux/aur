# Maintainer: Matteo Bonora <bonora.matteo@gmail.com>
pkgname=srec-git
pkgver=r23.4bf276f
pkgrel=1
pkgdesc="Utilities to convert binary files to and from Motorola S-Record (SREC) format"
arch=(x86_64)
url="https://github.com/arkku/srec"
license=('MIT')
depends=()
makedepends=('git' 'clang')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=("${pkgname%-git}::git+https://github.com/arkku/srec.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"

  make
}

package() {
  cd "$srcdir/${pkgname%-git}"

  install -Dm755 "srec2bin" "$pkgdir/usr/bin/srec2bin"
  install -Dm755 "bin2srec" "$pkgdir/usr/bin/bin2srec"
}
