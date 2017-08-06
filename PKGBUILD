# Maintainer: Dan Beste <dan.ray.beste@gmail.com>

# TODO: Include docs!

pkgname='stratisd'
pkgver=0.1.0
pkgrel=1
pkgdesc='Stratis is a new tool that meets the needs of Red Hat Enterprise Linux (RHEL) users calling for an easily configured, tightly integrated solution for storage that works within the existing Red Hat storage management stack.'
arch=('i686' 'x86_64')
url='https://stratis-storage.github.io/'
license=('MPL2')
makedepends=('cargo' 'git' 'rust')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stratis-storage/stratisd/archive/v${pkgver}.tar.gz")
sha256sums=(
  '712cac8d61f5b70f44df111134627fa7bde0a0b7c83a9b2ecb8da48849c3b258'
)

build() {
  cd "${pkgname}-${pkgver}"

  cargo build --release
}

check() {
  cd "${pkgname}-${pkgver}"

  make test
}

package() {
  cd "${pkgname}-${pkgver}"

  install -D -m 755 \
    target/release/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -D -m 644 \
    LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=2 sw=2 et:
