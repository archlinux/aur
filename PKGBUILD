# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=22.0
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
  59087aa3467d709420b1d53abd1bcdb8ee957ecae93399c815ed9ef27ca77576de15461be5096b5bf08fa1804c378068e08da82daeea5009553dbd814e10d0ec
  624d88abe246ec0fd1a597164b5e40c338a7d026d22c6973ed15610e7c460ab4b9c6d2c1a0621c7afa18aa5a14ca7d2a01978f801f298169520ae028df23a86c
  92e5e4858712d13368bb42be2c34d76dd7b3511f38d32502430d2d2abce7adff5c06081e1531c1e560ad2f5fe30cb7790360ec4bf0b70e29a6a0edf8d6b8f7d1
)
b2sums=(
  0ffcdbb1c5d5c399ebab312b2b176960f754522083eb0e897e9c828f5e128f468aaa5ece75e994f449b80a6e105b7aecab23e61af9f43c97c12cd0d48c79ad99
  55fa593b67030919f56f0e3b4865ba3cea0320f520e121a00a771103c7034b4780d9404419d2ab1103921275dce118f791701a9fc18ccdfd2ab86eda4242c6a8
  4f8c0f50868033086db11d0783b048275ae400c4f0100de7431bd1c0e5fb2dade31eb5e0801d9ef8974b337e9d08b40d3750a7a8d160fa1e6cd418bfc6970976
)
b3sums=(
  152feac0a165dafbf86d0a62e03fe1fa94b2a90eb523911ddb51c603f84a9a13
  066a0f8d1d32fa9b7254b484ad147b5a2e16ba203beb63fd86fce0745897e6e3
  c7aa8f50adb9f1acc1945eaab6c41a690d62b8dd04f11e2ccd7b41d49bcee474
)

if [ "${CARCH}" != "x86_64" ]; then
  source=(
    "ch-remote::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote-static-${CARCH}"
    "cloud-hypervisor-static::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static-${CARCH}"
  )
  sha512sums=(
    f3d7fc7785622f7ad7434b0659f1ddc67954014afa82bdce85fe8d80a30a2e04a245eae95932cfebf95df5cbdc61351c93f1c7b31e17ef31068be1683fe548b2
    0ac77fd419965908dcb830922ade4679b7c5473855f3539e3bc8e32ad1855a3352fd7152a353adaa467acf1c7aad135f79918de342f9f0dcb480e8e76d869f76
  )
  b2sums=(
    c841fef5a070c0f4824bda5902b4c40060076ad52aa60b438868974029072dfe48a1e89cb04d39c4f3415ae5916e5dc4be77f9ba05c433e2d392f78ed6f06058
    2cf94f6d5ff90e522e6b359d865638883416dc191ea96de9c6d7399b570baa7e3c42e24dff78f677d08c6f1aa4576ac36a093a0fde99ff185b19e2ca5d2455fd
  )
  b3sums=(
    65431242a5b0f14e488e053324531c0db0879f0fd18e2d9be369c6cb0c1b53f1
    39c630dadd9b84c2bc7bf3e7e60b52d52eb0136aef2eb2f5552d80b195c4b5f8
  )
fi

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/ch-remote" \
    "${srcdir}/cloud-hypervisor-static"
  [ "${CARCH}" != "x86_64" ] || install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/cloud-hypervisor"
}
