# Maintainer: Thomas Dagenais <exrok@i64.dev>
pkgname=evdoublebind
pkgver=r21.54434dd
pkgrel=1
pkgdesc="small evdev keyboard key macro binding and XKB generator for doublebindings"
arch=('x86_64')
url="https://github.com/exrok/evdoublebind"
license=('MIT')
depends=('libxkbcommon')
makedepends=('git' 'make' 'linux-headers')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
  cd "${srcdir}/${pkgname}"
  # Alternatively you can build a musl static binary
  # make musl-static
  make
}

package () {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" make install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
