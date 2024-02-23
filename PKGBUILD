# Maintainer: Tristan Kenis <k7p2k9eeb@mozmail.com>
# Contributor: azk <aphexv@gmail.com>
# Contributor: Andreas Wagner <andreas.wagner@lowfatcomputing.org>

pkgname=teensy-loader-cli-git
pkgver=2.2.r0.g9908286
pkgrel=1
pkgdesc="Command line loader for the teensy microprocessor boards"
arch=('i686' 'x86_64')
url="https://www.pjrc.com/teensy/loader_cli.html"
license=('GPL2')
makedepends=('gcc' 'make')
depends=('libusb-compat')
provides=('teensy-loader-cli')
conflicts=('teensy-loader-cli')
source=("${pkgname}::git+https://github.com/PaulStoffregen/teensy_loader_cli.git"
        "https://www.pjrc.com/teensy/00-teensy.rules")
sha256sums=('SKIP'
         '17f56b63603271e2cdae291fed347b66dfbdfd089b2847cf0b4383c877ffacfb')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "teensy_loader_cli" "${pkgdir}/usr/bin/teensy_loader_cli"
  install -Dm644 "${srcdir}/00-teensy.rules" \
    "${pkgdir}/etc/udev/rules.d/00-teensy.rules"
}
