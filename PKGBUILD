# Maintainer: azk <aphexv@gmail.com>
# Contributor: Andreas Wagner <andreas.wagner@lowfatcomputing.org>

pkgname=teensy-loader-cli-git
pkgver=2.1.r14.gf5b6d7a
pkgrel=1
pkgdesc="Command line loader for the teensy microprocessor boards"
arch=('i686' 'x86_64')
url="http://www.pjrc.com/teensy/loader_cli.html"
license=('GPL2')
makedepends=('gcc' 'make')
depends=('libusb-compat')
provides=('teensy-loader-cli')
conflicts=('teensy-loader-cli')
source=("${pkgname}::git+https://github.com/PaulStoffregen/teensy_loader_cli.git"
        "http://www.pjrc.com/teensy/49-teensy.rules")
md5sums=('SKIP'
         '97a691215b1865bc1d500b134f92427b')

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
  install -dm755 "${pkgdir}/usr/bin/"
  install -D -m755 "${srcdir}/${pkgname}/teensy_loader_cli" \
    "${pkgdir}/usr/bin/teensy_loader_cli"
  install -D -m644 "${srcdir}/49-teensy.rules" \
    "${pkgdir}/etc/udev/rules.d/49-teensy.rules"
}
