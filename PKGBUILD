# Maintainer: zer0def <zer0def@github>
pkgname=firecracker-bin
pkgver=0.25.2
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
url="https://github.com/firecracker-microvm/firecracker"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
provides=('firecracker')
source=("https://github.com/firecracker-microvm/firecracker/releases/download/v${pkgver}/firecracker-v${pkgver}-${CARCH}.tgz")

case "${CARCH}" in
  x86_64)
    sha512sums=(24d7a466019e786ded7eb6747108123c1f177e86d3197738ffc646a2f27f642576e052a8b52a0b75fa3b53de6e0a2828defa5dbba62b208e8c262248240c5059)
    b2sums=(dd1287cbbc2955368011417b56d24d7ab4d44b5d102a38541b5038d7a400dad71393ba25ab831cacf0aca8c1e6e344f56fb668af88ebb4c379941bed152a5e71)
    b3sums=(76083e777e58c85b24490ccc4e5c8811104273dfadc965ae29fc39363a8374ad)
  ;;
  aarch64)
    sha512sums=(d8a8a2c4bcd347dda63fdbbaed58bd9b8626b1d23be9fc1151d8fb5ebd4b65feea9eff304bf951d82817cf5af0a7a7ca1be37f2bd62d1cd72bf6f4119499f950)
    b2sums=(8b34e8be4965e048e51ef60c8938f1a346d2cbf852166d7fb6156781626a2201b8fe56a8f82fcd96e2ed637f32f3f2ed83cbdd3e56a27026f6fc9ac3b1ee1fc2)
    b3sums=(8b29c8054b8d8edcd18b4b160769a0b5120a853e15ef2037078751b880d1a82c)
  ;;
esac

package() {
  _srcdir="${srcdir}/release-v${pkgver}-${CARCH}"
  install -Dm755 "${_srcdir}/firecracker-v${pkgver}-${CARCH}" "${pkgdir}/usr/bin/firecracker"
  install -Dm755 "${_srcdir}/jailer-v${pkgver}-${CARCH}" "${pkgdir}/usr/bin/jailer"
  install -Dm755 "${_srcdir}/seccompiler-bin-v${pkgver}-${CARCH}" "${pkgdir}/usr/bin/seccompiler-bin"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/firecracker" \
    "${_srcdir}/LICENSE" "${_srcdir}/NOTICE" "${_srcdir}/THIRD-PARTY"
  install -Dm644 -t "${pkgdir}/usr/share/doc/firecracker" \
    "${_srcdir}/firecracker_spec-v${pkgver}.yaml" \
    "${_srcdir}/seccomp-filter-v${pkgver}-${CARCH}.json"
}
