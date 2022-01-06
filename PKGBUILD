# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=20.2
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
  75bf50135c3e0fb6fb533586dc95ebb288db1227df3363670f816a7299faede39bc8bc47045a8cf14b5dec96cb9088ed4d0bb4083a83c53e5cc871d6b0dea872
  1891ddb04894bcfabd4b769a92da862e214740f5c897df62cd252125d5b4cb039681d8f8bb50a96753c3f31a56d10e326f713f7603b551bcb0a8164366057305
  74173dd2550b17ab53101f907e6cfc7d88aa2c27c1222a9cff4f08f8a667248015c02942ab681d50846c3320a40100d855313dd91795b560c0f63d90048fc4b8
)
b2sums=(
  5241117869bb79c5298318760c49f862e97c55703ef25dce06e5387cf7742ac7d41853522cad3443daeebfc25cfa13c266af896bfbd3438cc1e7597c220a5974
  705ede04d64fb2868ee8c44d4028ecc3c5dd81bfcf5db52e1bf6a705ddbe68ff942fe062433d3d9691fab9432ac52c7141f4653e5341052f601856e9a6dc8724
  bf96e54a10cd94f6ccd3f92b5dd14e8cb7f975150868956c536e76799a345d083794dc3b6a9844370ff5843e542836d1365639931d7d21456567a81131905d89
)
b3sums=(
  081212b7120e927d1be9d35659d6cd57a8ff7a07608ca904508dfe0b2a9676e4
  35637529d5e613694585378e58bc7a229d27b9b33678be88f3bc4c75b2badc2c
  196d809e28760f62dfc1cfbcb295e33879b0f57ef8d85ab187828141ce2a048f
)

if [ "${CARCH}" != "x86_64" ]; then
  source=(
    "ch-remote::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote-static-${CARCH}"
    "cloud-hypervisor-static::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static-${CARCH}"
  )
  sha512sums=(
    0bba4e547a912dd4fe5e624efd06e7d22e8a96404cf0f80df0aec76d7a9b225f0132a10b2e8aaad37f95efcf0be555955f9280a0e1e26d92606334207da0c815
    c43c8cec6a2e7237412c5fe776f429d8cc4a785c17574f83982a52b67e5211f062918dfdf7519d6310eb5c4bd1f6146d9e37ef3d11aa74b193191fd20e8b7a30
  )
  b2sums=(
    2e98aacd1fc439aaef9621f14eb916ca3bb8bcfc0a4b72435599c06d6a1134a51106207b8dd61cfff88ea80319507b1c8ea2bd3f49a28edebd208ab89f0efa24
    60e22849a8550614af6d0013e0285c50910068e44ad83509f86a0266674b3527aad2f4f81a36f79b530580989e9dc15e9ebab345b9e509cbbc4c7f021a5c90db
  )
  b3sums=(
    1751def63365e7aa823499c265f2b6359936799a345ab012a30fa3fd6edda70c
    d3ac90db01ac2184bbf0017df6f9081613269f0005d25e5403a2c8be4f2ae192
  )
fi

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/ch-remote" \
    "${srcdir}/cloud-hypervisor-static"
  [ "${CARCH}" != "x86_64" ] || install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/cloud-hypervisor"
}
