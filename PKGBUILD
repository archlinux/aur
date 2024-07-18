# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="sui"
pkgname="${_pkgname}-bin"
pkgver=1.28.4
pkgrel=1
pkgdesc="A next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model"
arch=('x86_64')
url="https://${_pkgname}.io"
_url="https://github.com/MystenLabs/${_pkgname}"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'rust' 'openssl' 'libldap' 'krb5' 'e2fsprogs' 'keyutils' 'libsasl' 'postgresql-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README.md-${pkgver}::${_url}/raw/mainnet-v${pkgver}/README.md"
        "LICENSE-${pkgver}::${_url}/raw/mainnet-v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/mainnet-v${pkgver}/${_pkgname}-mainnet-v${pkgver}-ubuntu-x86_64.tgz")
sha256sums=('3ededb5b006bf86ea26c03f2073944998e2c8854f1ae150c35c8a418a16c9622'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('63b636efb7f54468d3db9b675bacf1b2606dcc1936b2642810ad35caab4120f6')

package() {
  cd "${srcdir}"
  install -Dm644 "README.md-${pkgver}" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -d "${pkgdir}/usr/bin/"
  find . -maxdepth 1 -type f -executable -exec install -Dm755 "{}" "${pkgdir}/usr/bin/" \;
}
