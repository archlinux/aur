# Maintainer: zer0def <zer0def@github>
pkgname=firecracker-bin
pkgver=0.25.0
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
url="https://github.com/firecracker-microvm/firecracker"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
provides=('firecracker')
source=("https://github.com/firecracker-microvm/firecracker/releases/download/v${pkgver}/firecracker-v${pkgver}-${CARCH}.tgz")

case "${CARCH}" in
  x86_64)
    sha512sums=(ffd3e9dfe7e2b29ce6c9ef61504056844d7081850dfe484ddb207d7339242819adf6d7a43e9c812c032fcf606daca8d10c125071d11dd5cfe431de41eb557c0f)
    b2sums=(e870c7d021f6c5b960c52883ab659fc33fec3b39314ec1ca5448f02b9596e88192831639c6817048b97954d28866eaa7b94b50821a6c991def345bce3b47b9bb)
  ;;
  aarch64)
    sha512sums=(2cc1882782e26492979c06fef06f162d4f1d20a8e1cacc2680b3ea54d6f028b951c6a14f1a3d4169079cd407f9e6e77c49e64b8dbebd4e329b683a1f38f90298)
    b2sums=(cbfbe04326f78491fccbde69ae28552db255ef88b1da4a6d3ba62fd8aac34e935677e7fc8d71d8efa56f87f764dfd17b3da6ff688fd0602f0b414060a402c0d2)
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
