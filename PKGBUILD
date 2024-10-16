# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="sui"
pkgname="${_pkgname}-bin"
pkgver=1.35.1
pkgrel=1
pkgdesc="A next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model"
arch=('x86_64')
url="https://sui.io"
_url="https://github.com/MystenLabs/${_pkgname}"
license=('Apache-2.0')
depends=('e2fsprogs' 'gcc-libs' 'glibc' 'keyutils' 'krb5' 'libldap' 'libsasl'
         'openssl' 'postgresql-libs' 'rust')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
noextract=("${_pkgsrc}-x86_64.tar.gz")
source=("README-${pkgver}.md::${_url}/raw/mainnet-v${pkgver}/README.md"
        "LICENSE-${pkgver}::${_url}/raw/mainnet-v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/mainnet-v${pkgver}/${_pkgname}-mainnet-v${pkgver}-ubuntu-x86_64.tgz")
b2sums=('7bc970b23c6f45ededef3d736898072b891a6e8bbb03d184db4495ab6f08a6557605866c7238ea5279ef96cbaa0b5fa484ce43ae000d43ff0643102b763fb3c7'
        '43452dd4216bba835bff542c02fcd0a80b77fef97a6f1042adcbbbcf312bb856b0707c35b2f1af356e0b4262e501a159f06bf1f947f182d0023cdd4aefbd8a85')
b2sums_x86_64=('918dd426220971712e631c23ee27be9116c45cb71cb98d2082aa520a1b3ed5fc3d754fe6b70911f6e0490ff749dc1d27de7e85e8206ca963cd858fe6875b0b96')

prepare() {
  cd "${srcdir}"
  mkdir -p "${srcdir}/${_pkgsrc}-${CARCH}/bin"
  bsdtar -xzf "${_pkgsrc}-${CARCH}.tar.gz" -C "${srcdir}/${_pkgsrc}-${CARCH}/bin"
}

package() {
  cd "${srcdir}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "${_pkgsrc}-${CARCH}"
  find "bin" -type f -exec install -Dm755 "{}" "${pkgdir}/usr/{}" \;
}
