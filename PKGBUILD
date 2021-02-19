# Maintainer: zer0def <zer0def@github>
pkgname=firecracker-bin
pkgver=0.24.2
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
url="https://github.com/firecracker-microvm/firecracker"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
provides=('firecracker')
source=("https://github.com/firecracker-microvm/firecracker/releases/download/v${pkgver}/firecracker-v${pkgver}-${CARCH}.tgz")

case "${CARCH}" in
  x86_64)
    sha512sums=(2a574276296685117acf4e1d425ca75ecb8ad06680ae81e183d73853ff57cbca2f4cf4f42cb013d8d88d18146c0d84d2b098829ca5f6e9402213fecdf539a283)
    b2sums=(d2b81e2b3341317f296c63f14b2699dbf207e2e3a83871e38ef1666c105112788308c773afad61a85f7c6f4009f2373c80f12a52549120d92a42bae54891bf59)
  ;;
  aarch64)
    sha512sums=(9bd83d278c3f4f294c4391aac1bd82712bde7190ad706e1b84a0ec9ad489c09f5fa77bd448a25a08b932230b38e44b3dbcdcc37b2ccacfd87d37c7ee65e6c1c6)
    b2sums=(8d5624f6f6f154678ffab945bbb293e3ab53c75fa324273d9cd99366d78230aef1ce0a23c0b8efdca9fd87edabc0e196dda0cacabf7ebb33ec86edf7c46dd92e)
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
