# Maintainer: Antony Kellermann <antony@aokellermann.dev>

pkgname=sway-scratch
pkgver=0.2.1
pkgrel=2
pkgdesc='Automatically starting named scratchpads for sway'
arch=('x86_64')
url='https://github.com/aokellermann/sway-scratch'
license=('MIT')
depends=(glibc gcc-libs)
makedepends=(git cargo)
optdepends=('sway: sway support'
            'i3-wm: i3 support')
_tag=e1af0f5ab37f5eb9ef4bef57a4ae512675671d81 # git rev-parse v${pkgver}
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('b20c7530f9b885141054fcdaf195d61013748597d7f3f5aeae0be8aac62a9d51f9c6f9efd1dbd2bef95319530314b1083cc90ac7d70fd02f8ac7cc9b09fef989')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release
  DESTDIR=target/release cargo docs
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" -t "${pkgdir}"/usr/bin/
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}.1" -t "${pkgdir}"/usr/share/man/man1/
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}-show.1" -t "${pkgdir}"/usr/share/man/man1/
}
