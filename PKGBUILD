# Maintainer: zer0def <zer0def@github>
pkgname=firecracker-bin
pkgver=0.25.1
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
url="https://github.com/firecracker-microvm/firecracker"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
provides=('firecracker')
source=("https://github.com/firecracker-microvm/firecracker/releases/download/v${pkgver}/firecracker-v${pkgver}-${CARCH}.tgz")

case "${CARCH}" in
  x86_64)
    sha512sums=(8108b7576655ae31c97f6349f5dd530aca2828acbb0d4589d6d0c113d44c4e14b28c4d76f73fe16c5538ce4940bd86e913e97ad35d7f915f8199bceaf4f74fe3)
    b2sums=(d577dfad765b8135471a673e9699c75bb7905e73496b7e9940a7634182267a1b3bfd8111088db4e1103da47e64159c585d46f8a9fb913ba3dcb1d4d1fe5f9920)
    b3sums=(4585ce77576143cb3d8acc36ed2951374dd37889c96fb83917558fdee461ad29)
  ;;
  aarch64)
    sha512sums=(1e3217a94f1a43b2ef84a5a07d2f1f2690ae1129787cb286ac4f1b8c82dbd15d7489149222f22cb58a9628e8cd1704cf387c17e71053367218425881f73610e5)
    b2sums=(613e575d06cd9e482cec705a1775099b4587311a579e3146f7b35bf2d26293384d5092106c7e666e1858c7d898cccb3a5173afcba57f8cce1b8a81547505c0e5)
    b3sums=(7a13088a6319c84d8243a1008a690dad1730f2938c01d8fddd11f92530fef1d3)
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
