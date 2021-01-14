# Maintainer: zer0def <zer0def@github>
pkgname=firecracker-bin
pkgver=0.24.1
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
url="https://github.com/firecracker-microvm/firecracker"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
provides=('firecracker')
source=("https://github.com/firecracker-microvm/firecracker/releases/download/v${pkgver}/firecracker-v${pkgver}-${CARCH}.tgz")

case "${CARCH}" in
  x86_64)
    sha512sums=(b719520464e3d5c9ff072c73639af71895bfcca9ac4964f2a255ed2d8d3b264a92566f7b87078c163c0f1ce21b9d5bd11cb38eb7cb784c5e18581ee531a0bcaf)
    b2sums=(a6b206042fe4dfa873cfa1da4f591242f0224d2c98b367635534497d2bf82e218c409e473be618bd2902594ea24a8c710c853f2f1a00ac96f917a100e80aec0b)
  ;;
  aarch64)
    sha512sums=(cbedc62e5b98cdfd6dfb565bc1b977d84fcd0fa28eb36e18922ec56c3c2dfa34c84c549c7a4e23aee9d16c53b212ef87128d42e68f1a6b9997cbec42e613a82d)
    b2sums=(17d85c6843dfa90bf871d5ff7dc5f5286c7bd11559cb9a507f57fafaba7d5abbf1019239ea39529e29a8bb4fa32b9a8a44f096f1379dc2d3d801502890690024)
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
