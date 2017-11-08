# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

pkgname='stratisd'
pkgver=0.1.2
pkgrel=1
pkgdesc='Stratis is a new tool that meets the needs of Red Hat Enterprise Linux (RHEL) users calling for an easily configured, tightly integrated solution for storage that works within the existing Red Hat storage management stack.'
arch=('i686' 'x86_64')
url='https://stratis-storage.github.io/'
license=('MPL2')
makedepends=('cargo' 'git' 'rust')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratisd/archive/v${pkgver}.tar.gz")
sha256sums=('e2ed03e665d1064502f7f7061e13f1406cdea0de4f8cfd930fb714df65b2a6d3')

build() {
  cd "${pkgname}-${pkgver}"

  cargo build --release
  cargo doc --no-deps
}

check() {
  cd "${pkgname}-${pkgver}"

  make test
}

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
