# Maintainer: Felix Singer <felixsinger@posteo.net>

_commit='a1d938f8b4253c76fb31e69de33266cb71bda141'

pkgname='em100'
pkgver=r247.a1d938f
pkgrel=1
pkgdesc='Open source tool for the EM100 SPI flash emulator'
url='https://www.coreboot.org'
license=('GPL2')
arch=(x86_64 aarch64 riscv64)
depends=('curl' 'libusb') # TODO
makedepends=('git') # TODO
source=("git+https://review.coreboot.org/em100#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make em100
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 em100 "${pkgdir}/usr/bin/em100"
  install -Dm644 60-dediprog-em100pro.rules "${pkgdir}/usr/lib/udev/rules.d/dediprog_em100.rules"
}
