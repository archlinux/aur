# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=25.0
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
sha512sums=('a614d82f084ba8cd6e42763700205dd84824b088c0cca8e3e1a40f9cd5e163828b18e7f6b477482c681e1b71545793d417b23adf21cc4665187a001f0ff3352a'
            'aa88c5c45c37e914f0baad4b969f1a903b243afd69f706e0ac4f9f1e50b6365b106a327fa5d5fc6e50825a56d9efb40e859a6addd5b5d65d4856c3751a8e1ab3'
            'd3f73051baadd32a7c931613598eefb6ce768d328f028dea69d5aa879ebcf734258bfd69e852d5f829b77abaf9bf16bb93271b1d482baca7042bb70ec8a29c36')
b2sums=('21788046b290d94f6b0686aa531ff8f9c3e9dc4f5f9ffd02014ced8e8ea285448a1d9f39e2f7c1ea56bde9b8d13befc1065dfefb03e79c8d86bd3a4d9776409f'
        '8b32e6303dcdc46d84e122e714c830951c54e8d9df0ee769a5d1f6ed1d33d38d4fdae2ea762fbfaf33a69bf3330cb0f684d0c676aabd8a939bc76c23c2fd80f0'
        'c1ba12e6d587471204a9962d69764663063747d806c0fe9d158f13a00564e99ee2283f6acae08bf7a83f3a468af66ed646ae3d371d3eada0836b87d1239922bf')

if [ "${CARCH}" != "x86_64" ]; then
  source=(
    "ch-remote::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote-static-${CARCH}"
    "cloud-hypervisor-static::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static-${CARCH}"
  )
  sha512sums=('e1d2bda7c278aa477bdb32c0b40e615d3e582751b36f412e06b164dca3c53a59452a9f989410311399debf692faba5b4233664de31eb3c6f95aa203083910d94'
              '02200a125df2761fb7acf3305828ca1b320d96d49b696858229ce33d4202732d07ba8e7b8cabece83683d89eff4070279def2cd001f93b20ee21c1675cbc06e8')
  b2sums=('cc595b2e01a591d7ea87c85ef0cac140429adc7a0100562818c50ede63484e6d857ba743bbb18cd5c073d21b3d5d5ba7ce2c60078afa5365ac62e9d5fbbef534'
          'f71de0fd5bc35e892c5073dc5fd237bc039f7b54241f3a04bb1cf07fe5c1b11249c0ff6aa68759d02c485a1c52144cf04e81fa6b561b30abff9e9be4d09f1e8f')
fi

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/ch-remote" \
    "${srcdir}/cloud-hypervisor-static"
  [ "${CARCH}" != "x86_64" ] || install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/cloud-hypervisor"
}
