# Maintainer: zer0def <zer0def@github>
pkgname=firecracker-bin
pkgver=0.24.5
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
url="https://github.com/firecracker-microvm/firecracker"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
provides=('firecracker')
source=("https://github.com/firecracker-microvm/firecracker/releases/download/v${pkgver}/firecracker-v${pkgver}-${CARCH}.tgz")

case "${CARCH}" in
  x86_64)
    sha512sums=(746f1af7a37b2ecdd86faee75ee0cacf01aa80aa6f060cc75761f930df0da9a6f6597fea4235035ba10f6198909b5b2f7a834571c52d73e647611f9be8fa0967)
    b2sums=(70e16dc651ae1071b9f223f0a21eaba6a8ad515d75847698cbf67ac73053cb8c52d67cd46a315e5681dadbab92ecc4d0d43ecbba9928dc2f52a5168c0a889a97)
  ;;
  aarch64)
    sha512sums=(518f122f277a293b54bd870bb166847e4d7fa87574e47d3cd606d35e260ebd7359806922e09fb86cf16fb2ee3969bbf68b40538150e7064c866710c1803fada8)
    b2sums=(11e260d4afcd5f5ebabeb5c773060250a9205a8110ea4f0915d1b8b3eb7fc448a2a99159d73d2bfaa9b1e9ea88258996de73e296b9916c533f9b7eac8c77fc15)
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
