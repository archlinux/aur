# Contributor: Felix Singer <felixsinger@posteo.net>
# Maintainer: Jan Samek <jsa@nablaspace.com>

_pkgname='em100'
pkgname="${_pkgname}-git"
pkgver=r257.0c07a11
pkgrel=1
pkgdesc='Open source tool for the EM100 SPI flash emulator (latest version from the branch)'
url='https://www.coreboot.org'
license=('GPL2')
arch=(x86_64 aarch64 riscv64)
conflicts=('em100')
provides=("em100=${pkgver}")
depends=('curl' 'libusb') # TODO
makedepends=('git') # TODO
source=("git+https://review.coreboot.org/em100")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make em100
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 em100 "${pkgdir}/usr/bin/em100"
  install -Dm644 60-dediprog-em100pro.rules "${pkgdir}/usr/lib/udev/rules.d/dediprog_em100.rules"
}
