# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=zeroskip-git
pkgver=r354.1945d64
pkgrel=1
pkgdesc="A key-value database library"
arch=('x86_64')
url="https://github.com/cyrusimap/zeroskip"
license=('MIT')
depends=('zlib' 'libutil-linux')
makedepends=('git' 'check')
provides=("zeroskip=${pkgver}")
conflicts=("zeroskip")
source=("git+https://github.com/cyrusimap/zeroskip.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/zeroskip"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/zeroskip"

  autoreconf -i
}

build() {
  cd "${srcdir}/zeroskip"

  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/zeroskip"

  make check
}

package() {
  cd "${srcdir}/zeroskip"

  make install DESTDIR="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
