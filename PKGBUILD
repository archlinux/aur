# Maintainer: Seraphim Pardee <me at srp dot life>
pkgname=jadens-printer-driver
pkgver=3.3.5.497
pkgrel=1
pkgdesc='CUPS support for JADENS thermal printing devices'
arch=('x86_64' 'aarch64')
url='https://github.com/RdrSeraphim/jadens-printer-driver'
license=('LicenseRef-Proprietary')
depends=('cups')
source=("${pkgname}-${pkgver}-x86_64.tar.gz::https://raw.githubusercontent.com/RdrSeraphim/jadens-printer-driver/sources/${pkgname}-${pkgver}-x86_64.tar.gz"
        "${pkgname}-${pkgver}-aarch64.tar.gz::https://raw.githubusercontent.com/RdrSeraphim/jadens-printer-driver/sources/${pkgname}-${pkgver}-aarch64.tar.gz")
sha512sums=('bbb8d90a6bee317a5e35fbe1ef1923ae42377346962a9c52c2a87999daf7d9fe5368cfd4ebfedb4aa58f693be3cc46b1f57a8877da720ec6a32f01aad1e30a35'
            '5255eab5ac25ce16d46c42e1bbd108e7d89d323ec4d498356a4c9c5f6e63e1a6cbdb93d57d116f8c5dd18ad33c50efdc123745aa2e740fb2ab4f9eb719e9b33d')
noextract=("${pkgname}-${pkgver}-x86_64.tar.gz"
           "${pkgname}-${pkgver}-aarch64.tar.gz")

prepare() {
  cd "${srcdir}"

  if [[ "${CARCH}" == "x86_64" ]]; then
    tar xzf "${pkgname}-${pkgver}-x86_64.tar.gz"
  elif [[ "${CARCH}" == "aarch64" ]]; then
    tar xzf "${pkgname}-${pkgver}-aarch64.tar.gz"
  fi
}

package() {
  install -Dm755 "${srcdir}/usr/lib/cups/filter/jadens_printer_filter" \
    "${pkgdir}/usr/lib/cups/filter/jadens_printer_filter"

  install -dm755 "${pkgdir}/usr/share/cups/model/Jadens"
  install -Dm644 "${srcdir}"/usr/share/cups/model/Jadens/*.ppd \
    -t "${pkgdir}/usr/share/cups/model/Jadens/"
}
