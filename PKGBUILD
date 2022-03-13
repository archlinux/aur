# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=22.1
pkgrel=1
pkgdesc="A Rust-VMM based cloud hypervisor from Intel (binary source)"
url="https://github.com/cloud-hypervisor/cloud-hypervisor"
arch=(
  'x86_64'
  'aarch64'
)
license=('Apache:2.0')
optdepends=(
  'qemu-headless: for /usr/lib/qemu/virtiofsd'
  'virtiofsd: rust implementation of virtiofsd'
)
provides=('cloud-hypervisor')
conflicts=('cloud-hypervisor')

source=(
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote"
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor"
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static"
)
sha512sums=(
  bf7f87476aa486ad4cbde8ce022888a8808bb8571db542e66cd73856f3469d6ef2dbc854adf5d9a29da78c62a9e3f3f868ba341d6b2d623e1594a9f2e80a2312
  36dd16fddb0f7cb3051a451a5963fa3bed18a83dda866032f9b860192fc85da483e81238bd56b60ef0c18354ca0a045bacb417e34e729e7da21ae72e46bfd149
  633d834952d9052d14d931a30c2fe3c34c8c5b024d0ac84b52b5b7dfd06f0b35146f3f0f7307244e8eab217e256287d9a8f4dc36b7ecd9682315a9fd0e8c12aa
)
b2sums=(
  b1f670aea7e5ce2f58cbaf2463031c644c49f1529242373626759c905198a7603a46e63faaa6fc23972baeb6e133c2cdfd2863aeb3af586baeeb76c097f2bbad
  7d9132571dd31fad295817aeb49d5dae282ffd7b93cdab447137debc6e69a42c80efeeb86c1b5f228d70c98e31951e172f3a563d3b5dfbce71565045d4b68749
  75e4f13da1ba251ad8dd634407c9446aa196e11ea17d8f5a878c598bf39edfb478c7bde08d289c267f30ee3ccac83e1885c92294240101dd506a69d7d2bb000c
)
b3sums=(
  b3eb51b505b71caa76a096d1aa9da6ce3e3820b02929f585903105b72712bf12
  aed94f15a77df2b8ebe9cb3b227a40a5e2de2d4bbd817bd9b59b212f1417dadf
  750b7b734614d7845d32de1d14e9a0f01ffac0292d6d27908300e00a07d331a4
)

if [ "${CARCH}" != "x86_64" ]; then
  source=(
    "ch-remote::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote-static-${CARCH}"
    "cloud-hypervisor-static::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static-${CARCH}"
  )
  sha512sums=(
    963846c794ea0f97283a36cee3b856fa7fb8aa26432f4f0856625eb9224699a183858e31b44ec241c7c6cdba0880b0f39ebf6b5157613e6b7a302352a86c4e62
    d6bfc1c735d903f7850ac4a03812384d3d53a2fd888a57da197fa819cb3ee6a778c55f0993816eb0631bedc9c802b0d17e2401b8771834570e50f1229aaad3cb
  )
  b2sums=(
    2e166963609e8fdbd7b00ca2605f82c468010590499529798620b222bb04275721b76f92a1e8ce0d97e158b00ab2b52af827a28dfc74fb680b269e298a1fa3e9
    715ba635a066a38b63dc6d320becbcf0db4e1a4b4b5dc636d83bcd18f11fcbab705258441beabce9073d9ff60ea4628e06303eabf7e0bdf9b99c36a41fcbb611
  )
  b3sums=(
    bf994b5ddbcc9748e8320b4f294d4b12a352d1b9027f68552d051fa9e88f78c6
    c9c225dcbb8c35baab306057fc08e3d4354546e7f3b43322310b1403a032281b
  )
fi

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/ch-remote" \
    "${srcdir}/cloud-hypervisor-static"
  [ "${CARCH}" != "x86_64" ] || install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/cloud-hypervisor"
}
