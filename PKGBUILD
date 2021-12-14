# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=20.1
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
  f6202f8917930aae16f684580198ae83a028cede529e2ae88908e35f9d82b27409ede4b10f5952c449e80485c17057c25c349fc6df64fb225ab4d17373d7abd9
  f21c43934d8990baabbe93ddf8d14b16bea8f27a57a48d638589fb3b9d3bda4556ebcd73806ac36e7d247a33777c7fba2085f3d99001a9c3f9271149a79cf96a
  866c8bf4ca164e52e0e02c4dd819826bef8177e1766ea52d9e15a70755c4c90d119da3f8a60d98732c12cb159efe9afffcebca53a3215ddcf81689cfd49db79c
)
b2sums=(
  a9c587387a5504a9c671d534b1fa9407205e52896dd824f890e7096410b65a8031ecaa557e1d8c4ad081d181765ba517934b3a053fc73c4aabf40cf966afc9fb
  6583fb38213b774998c90dcae9878080776d4a210b1e98e4dc74046424997189dcdf0ac7be85dc1b6e7de8e8f11419baa3d894eb7ae954edaa4e6bc162dfb954
  ed1848c0ab47f5405db654aaf3584e20461fff1ab6e2efc6881320e3c454352371192bbffc8fe752718bfaaf2b5e8711afad913e2bc4e92d1214063cf290316a
)
b3sums=(
  ceaae55a26ef8da5dc84cdd75b08213a7102db6cd83a1e43bda53cd9652fe63e
  4ff4b5db408f2dfc09f904d21081c4a427a007a35e85fda16eb0d271a57cf3fb
  bd2008ba9725d53701710ea8584166e6dde8473a00712f3c232761adb5c6c2c1
)

if [ "${CARCH}" != "x86_64" ]; then
  source=(
    "ch-remote::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote-static-${CARCH}"
    "cloud-hypervisor-static::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static-${CARCH}"
  )
  sha512sums=(
    07f6323b2124567e2094e84f4adc1ba3120ee147fff8d65f78719d5c10821956d471d8b380d276e4ea0e390113df05ae112ade8a259491a26f95708c095f9470
    c70d5dc671583df6d1f123b52e7dc7988b930562f51886800f2d0812f5b2338f75ffe086905e45a0a078adec66361b9b3240a16e4feb40ab177382b88cb0be5a
  )
  b2sums=(
    aa176110b032295cf2aefb35320fec31b283dca27eb89838592846d9f36cc2e57791e34fcfc5fafaa2b226423c71eefdc160b2013f443f85eb1dbee84d05a118
    cd5e1e3348a7fb5c8a99169a678d4f8c85721125f91768989bd2e2da820fed7e0b486719312cafe8e51a2edd3072e53aeec4835b10f54a2d4f0e8624d9c069d0
  )
  b3sums=(
    8f14e41736694768306c360c61ef016fdcca5ff500b3f205de424455e72ebcbe
    6a3f648cc7731c165086729db0dadcf484382cff2ad6698c8c1ad31a22c1931b
  )
fi

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/ch-remote" \
    "${srcdir}/cloud-hypervisor-static"
  [ "${CARCH}" != "x86_64" ] || install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/cloud-hypervisor"
}
