# Maintainer: Nathan Fisher <jeang3nie@hitchhiker-linux.org>

_pkgname=zterm

pkgname="${_pkgname}"
pkgver=0.3.1
pkgrel=1
pkgdesc="A simple terminal emulator using Vte and Gtk+ writting using the Zig programming language"
url="https://codeberg.org/jeang3nie/zterm"
license=('MIT')
depends=('libgtk-3.so' 'libvte-2.91.so')
makedepends=('git' 'zig' 'zigmod')
arch=('x86_64')
provides=('zterm')
conflicts=('zterm')
source=(
  "${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'fdd32d9bfe1a0e6562461dc805a0c916a0c1fb76f8ded116783b76d9cbb7124f'
)

build() {
  cd "${srcdir}/${_pkgname}"
  zigmod ci
  zig build -Drelease-safe=true
}

package() {
  cd "${srcdir}/${_pkgname}"
  zig build -p ${pkgdir}/usr -Drelease-safe=true
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${_pkgname}/README.md"
}
