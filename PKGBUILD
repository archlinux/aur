# Maintainer: Antonio Vázquez Blanco <antoniovazquezblanco@gmail.com>

_pkgbasename=libatasmart
pkgname=${_pkgbasename}-git
pkgver=0.19.r2.g56afac4
pkgrel=1
pkgdesc='ATA S.M.A.R.T. reader and parser library'
arch=('x86_64')
url='https://github.com/libatasmart/libatasmart'
license=('LGPL')
depends=('glibc' 'systemd-libs')
makedepends=(git meson)
provides=("libatasmart=$pkgver")
conflicts=('libatasmart')
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgbasename}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${_pkgbasename}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
