# Maintainer: zer0def <zer0def@github>
pkgname=firecracker-bin
pkgver=0.24.3
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
url="https://github.com/firecracker-microvm/firecracker"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
provides=('firecracker')
source=("https://github.com/firecracker-microvm/firecracker/releases/download/v${pkgver}/firecracker-v${pkgver}-${CARCH}.tgz")

case "${CARCH}" in
  x86_64)
    sha512sums=(250edc60d116a52f4752434fdaad4cc99c3a662f5d1983bc051c1e4a97edd89123414ee51f377ce97db211bcf20628c06e28021df25ddecf9a57008e6cf59a6b)
    b2sums=(aa33ce4c9711ce3a515d1b7760dc9ec5a5f08aaba923515bca803bb04aa6493dd39f834673cc6c59a8ceebfd9bf7429cb33b1597a241ae0a9656be9f752be829)
  ;;
  aarch64)
    sha512sums=(b4b75b7d87d99436abe2f350d6a67c6d057da23cdfdfbdaafacc5a96a551ad4280745573f772191ee3bee442b9cf8982553881038fb58ac838ea5c35fa466aaa)
    b2sums=(8af0a8b311ee1d45ef8cefc8d48982c5dc9c6b959a7ea9fa5d16a651c2f48f4fb1dd084c46d3bbf653389434623b292180f876db793619115f7374d37495db33)
  ;;
esac

package() {
  _srcdir="${srcdir}"
  install -Dm755 "${_srcdir}/firecracker-v${pkgver}-${CARCH}" "${pkgdir}/usr/bin/firecracker"
  install -Dm755 "${_srcdir}/jailer-v${pkgver}-${CARCH}" "${pkgdir}/usr/bin/jailer"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/firecracker" \
    "${_srcdir}/LICENSE" "${_srcdir}/NOTICE" "${_srcdir}/THIRD-PARTY"
  install -Dm644 -t "${pkgdir}/usr/share/doc/firecracker" \
    "${_srcdir}/firecracker_spec-v${pkgver}.yaml"
}
