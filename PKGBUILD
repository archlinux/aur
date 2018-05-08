# Maintainer: Streetwalrus <streetwalrus@codewalr.us>
pkgname=somagic-easycap-git
pkgver=r265.88d6764
pkgrel=1
pkgdesc="Linux Somagic EasyCAP DC60, EzCAP USB 2.0, and EasyCAP002 capture software"
arch=('x86_64')
url="https://github.com/Streetwalrus/easycap-somagic-linux"
license=('GPL' 'GPL3')
depends=('libusb')
provides=('somagic-easycap')
conflicts=('somagic-easycap')
makedepends=('git')
source=('git+https://github.com/Streetwalrus/easycap-somagic-linux.git')
md5sums=('SKIP')
install='somagic.install'

pkgver() {
  cd "${srcdir}/easycap-somagic-linux"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/easycap-somagic-linux"
  make
}

package() {
  cd "${srcdir}/easycap-somagic-linux"
  install -d ${pkgdir}/usr/bin
  install -m755 somagic-{init,capture,audio-capture,both} ${pkgdir}/usr/bin

  install -Dm644 somagic_firmware.bin ${pkgdir}/usr/lib/firmware/somagic_firmware.bin

  install -d ${pkgdir}/usr/lib/udev/rules.d
  install -m644 50-somagic.rules ${pkgdir}/usr/lib/udev/rules.d

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 LICENSE.firmware ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.firmware
}

# vim:set ts=2 sw=2 et:
