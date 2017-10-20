# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

# TODO: Include docs!

pkgname='stratisd'
pkgver=0.1.1
pkgrel=1
pkgdesc='Stratis is a new tool that meets the needs of Red Hat Enterprise Linux (RHEL) users calling for an easily configured, tightly integrated solution for storage that works within the existing Red Hat storage management stack.'
arch=('i686' 'x86_64')
url='https://stratis-storage.github.io/'
license=('MPL2')
makedepends=('cargo' 'git' 'rust')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratisd/archive/v${pkgver}.tar.gz")
sha256sums=('c0a95563ceaba5633733ce5d7816883ca7f5e9e2f22591703af8f30b67475e05')

build() {
  cd "${pkgname}-${pkgver}"

  cargo build --release
  cargo doc --no-deps
}

#check() {
#  cd "${pkgname}-${pkgver}"
#
#  make test
#}

package() {
  cd "${pkgname}-${pkgver}"

  install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/usr/share/doc/"
  install -d -m 755 "${pkgdir}/usr/share/licenses/${pkgname}"

  install -m 755 target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -r target/doc/* "${pkgdir}/usr/share/doc/"
}

# vim: ts=2 sw=2 et:
