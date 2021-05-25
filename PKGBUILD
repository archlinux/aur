# Maintainer: zer0def <zer0def@github>
pkgname=firecracker-bin
pkgver=0.24.4
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
url="https://github.com/firecracker-microvm/firecracker"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
provides=('firecracker')
source=("https://github.com/firecracker-microvm/firecracker/releases/download/v${pkgver}/firecracker-v${pkgver}-${CARCH}.tgz")

case "${CARCH}" in
  x86_64)
    sha512sums=(42f316de6bf1444cc7163b02dedd1492c21d0583da1a2a5193e3941cc1d6a59c3c79d275df3d903914f30d021a3e6c7d8f7338c12c088426adf22045750b7db3)
    b2sums=(893d1c8392f76cc45668cc8823daae2895f675cbcdffb3431fe51495964611f61263caeaa7a149c5dd0f29122e8a6f8705e66166b1c6a192c9c97d49b7f915c8)
  ;;
  aarch64)
    sha512sums=(fe2d8441a790310f0fecd82fc316e214d9d03f182f3837ac4d5464101954053c5a98976b7178ffe7e6c1e0fbc4a7e7203ccd92e4f8bc74fbccfd889adc7e43cc)
    b2sums=(98a9725cfa6fca607081a5c2461980b02417400a58ddce872a45c09b14559b41998dc6707de280c399535262d29dbd5120d5e2eff1b8403f84d66625e97700aa)
  ;;
esac

package() {
  _srcdir="${srcdir}/release-v${pkgver}"
  install -Dm755 "${_srcdir}/firecracker-v${pkgver}-${CARCH}" "${pkgdir}/usr/bin/firecracker"
  install -Dm755 "${_srcdir}/jailer-v${pkgver}-${CARCH}" "${pkgdir}/usr/bin/jailer"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/firecracker" \
    "${_srcdir}/LICENSE" "${_srcdir}/NOTICE" "${_srcdir}/THIRD-PARTY"
  install -Dm644 -t "${pkgdir}/usr/share/doc/firecracker" \
    "${_srcdir}/firecracker_spec-v${pkgver}.yaml"
}
