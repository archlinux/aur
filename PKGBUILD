# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=20.0
pkgrel=1
pkgdesc="A Rust-VMM based cloud hypervisor from Intel (binary source)"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=(
  'x86_64'
  'aarch64'
)
license=('Apache:2.0')
optdepends=(
  'qemu-headless'  # for /usr/lib/qemu/virtiofsd
)
provides=('cloud-hypervisor')
conflicts=('cloud-hypervisor')

source=(
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote"
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor"
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static"
)
sha512sums=(
  ff53bed07aa2f1d56c541ac05d8fbc5d46511189f5b5b9f93852e1d48f87d99de853cd736b8fa853db1bc6ffa9514c180a6d284cc0f076585184bcfe7449eafb
  15cfcd27865fee5cdb7ca715fd9740a1d21683bab9920324b4520eb72d0c67e20a954eaadd96d237db1f63e69c6021b90cb6bb0e7bcee1fb9c7d0fd52db8baf3
  63a3fb89e49a4ebb7c66a199e41e1091f6d01b0916dc31f2ca4a5ea6ddd800f533cc166758ee385c1b809a9fe217dd8ab5cf7a19076b8ac3c0ba00132bc2fdc5
)
b2sums=(
  e47ef945f62037a1ed55fe297edd1845b292b78267b36fe1ac8b0c5c9e3ea66cf7bc45f4999389b94ba09bcbfa588d7e5a2d07d9a5d9bc14fa86b56870a12252
  0fed8f53bd26e0ea800e0ccf55ce0615eac1359cdd7591845bd400992aaa01e28a6e25da0c31b2ce64e9d48d862acea35395b938e2f581681edad22bc2651035
  859bbf29b1bab43aa5ffb64ad7b0bc87eddf4e2cca8951775da41bc67b5e4d2ada8d094d0fc4065753a224dcaeb8c48fc336727cea102a313bc5d98ce40c29be
)
b3sums=(
  f5cbf83423eaaa6d2984af54eb25a22e7f5a0c3e3529d52c200ce4b969d7d826
  7bad55f3870c88244a0e13d650026f682bb9394bfeca0edd89cebcd79f0f41c7
  ed754f44d359ccfdfc4830153af81c90fb8f3028f136229af4540e782b8a0634
)

if [ "${CARCH}" != "x86_64" ]; then
  source=(
    "ch-remote::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote-static-${CARCH}"
    "cloud-hypervisor-static::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static-${CARCH}"
  )
  sha512sums=(
    48ae24bd7b63af2601e6e072c2177e299276de54e5b494d5e6ba59193fc2801a1c82dc9f8a29d50d7fec483b0584a15c328af0c25ec6fa1738c79ac3f7701656
    d4d9e035b3c8413ccbe7ef054789d67477e8a783a39b5e84e221286f6ff9eb52f462556083bc47fc1c25a61a1619c6968f0c88a98ec85fd39ee3c621e578b2b1
  )
  b2sums=(
    9007b2235ed38190353e0d9e4f549e9c6b11ed70090c2c638ed2ee08fc3fcce3cde3aa5c5eba132c629b5e824edbf79c7123b956c82e982ccd640924c052f775
    5781d638f7c73c3ac024e1cb9f278427060579e5cfe034d52642c50015889c13539129c028d67820f01e87fd7a908b6f2fec6520f6d796136c2e3b9428dcf3de
  )
  b3sums=(
    a1f5ca4f97ca5899acc58fb29dad0293df5ff7a12a7db260cbedc35b865c8098
    9b94b025d0b6a4fe586512866baf1adf44afe04399a71e340216aa019b0a9910
  )
fi

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/ch-remote" \
    "${srcdir}/cloud-hypervisor-static"
  [ "${CARCH}" != "x86_64" ] || install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/cloud-hypervisor"
}
