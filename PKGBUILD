# Maintainer: Sougato Chakrobortty <someonesomething800@gmail.com>
pkgname=cysinfo-git
_pkgname=cysinfo
pkgver=3.0
pkgrel=1
pkgdesc="A super simple and minimal fetch tool."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/charged/cysinfo.git"
license=('custom:unlicense')
depends=()
makedepends=(git make gcc)
provides=(cysinfo)
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "3.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 UNLICENSE "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
