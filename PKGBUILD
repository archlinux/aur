# Maintainer: zer0def <zer0def@github>
pkgname=firecracker-bin
pkgver=0.24.0
pkgrel=1
pkgdesc="Secure and fast microVMs for serverless computing"
url="https://github.com/firecracker-microvm/firecracker"
arch=('x86_64' 'aarch64')
license=('Apache:2.0')
provides=('firecracker')
source=("https://github.com/firecracker-microvm/firecracker/releases/download/v${pkgver}/firecracker-v${pkgver}-${CARCH}.tgz")

case "${CARCH}" in
  x86_64)
    sha512sums=(7d8a2b1c109d24c5c7f81bd5ef193f92527b35d55790845feea1201b87ca7f9d997a65d29b5b4a913fe79c7764df6093c6fc2828d01448e6ca9f9f5e110be29c)
    b2sums=(77503adf8093d82ea93554c4951cf39f5090cfbb5722e2cee9b9b687aaf0a23e4d2423401fcb8bcb5517fa725a7da7752a438e38c4e9099323f88b77e16d2041)
  ;;
  aarch64)
    sha512sums=(e50eef5d6e011c3bc4ecb5ab58b2964732f7ea382b30b963646e0a7e928ec33338dba3c08988a2958382235fc24b17d185563fd0704b256fff1eb6a00955beba)
    b2sums=(c9fcc2f2dd6d05457bb4d088be191124e822ca3ada4789ceebfec53bf344cf9cab92c8fa26d695dc70cf8e52fbc3ee0bea41d6a43abcc2ed527dae97686a74f3)
  ;;
esac

package() {
  install -Dm755 "${srcdir}/firecracker-v${pkgver}-${CARCH}" "${pkgdir}/usr/bin/firecracker"
  install -Dm755 "${srcdir}/jailer-v${pkgver}-${CARCH}" "${pkgdir}/usr/bin/jailer"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/firecracker" \
    "${srcdir}/LICENSE" "${srcdir}/NOTICE" "${srcdir}/THIRD-PARTY"
  install -Dm644 -t "${pkgdir}/usr/share/doc/firecracker" \
    "${srcdir}/firecracker-v${pkgver}.yaml"
}
