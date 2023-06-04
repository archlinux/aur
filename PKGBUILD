# Maintainer: Tim van Leuverden <TvanLeuverden at Gmail dot com>

pkgname=ruri
pkgver=2.1.0
pkgrel=1
pkgdesc="Calculates the CRC-32 of files and checks them against their filename"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://gitlab.com/Timmy1e/ruri"
license=('AGPL3')

provides=('ruri')

depends=('gcc-libs')

makedepends=('cargo')

source=(
  "https://gitlab.com/Timmy1e/ruri/-/archive/v${pkgver}/ruri-v${pkgver}.tar.gz"
)

sha256sums=(
  '30ce2f395e3bfcf4891ef544f139d072466b8fff00b832a02d32bed4aa952f49'
)

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  export CARGO_REGISTRIES_CRATES_IO_PROTOCOL=sparse
  cargo install --locked --no-track --bin ruri --path . --root "${srcdir}"
}

package() {
  install -Dm755 "${srcdir}/bin/${pkgname}" \
                 "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-v${pkgver}"/target/release/build/ruri-*/out/ruri.* \
              -t "${pkgdir}/usr/share/man"
}

# vim: sw=2 ts=2 tw=80 et: