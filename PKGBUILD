pkgname=ch341eeprom-git
_gitname=ch341eeprom
pkgver=a
pkgrel=1
pkgdesc="A libusb based programming tool for 24xx I²C EEPROMs using the WCH CH341A"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/commandtab/ch341eeprom"
license=('GPL')
depends=('libusb>=1')
makedepends=('git')
source=("${_gitname}::git+https://github.com/commandtab/ch341eeprom.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  make
}

package() {
  cd "${srcdir}/${_gitname}"

  # Install the program
  install -Dm755 ch341eeprom "${pkgdir}/usr/bin/ch341eeprom"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set ft=sh ts=2 sw=2 et:
