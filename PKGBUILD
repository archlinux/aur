# Maintainer: Andreas Wagner <andreas.wagner@lowfatcomputing.org>
pkgname=teensy-loader-cli-git
pkgver=16.001da41
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
         '9f0593b4f3dab6d9a32ebc993d6aedc3')

pkgver() {
  cd $pkgname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin/"
  install -D -m755 "${srcdir}/${pkgname}/teensy_loader_cli" \
    "${pkgdir}/usr/bin/teensy-loader-cli"
  install -D -m644 "${srcdir}/49-teensy.rules" \
    "${pkgdir}/etc/udev/rules.d/49-teensy.rules"
}
