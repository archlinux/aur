# Maintainer: azk <aphexv@gmail.com>
# Contributor: Andreas Wagner <andreas.wagner@lowfatcomputing.org>

pkgname=teensy-loader-cli-git
pkgver=2.1.r14.gf5b6d7a
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
        "https://www.pjrc.com/teensy/49-teensy.rules")
sha256sums=('SKIP'
         '031de0b26991b5a3b19c497d9c0a17f86c40c55d925b9d07d19ab89f2286469d')

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
  install -Dm644 "${srcdir}/49-teensy.rules" \
    "${pkgdir}/etc/udev/rules.d/49-teensy.rules"
}
