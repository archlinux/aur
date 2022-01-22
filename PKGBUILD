# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=21.0
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
  c2ba93673f67213da3da9a3ecddfac05b9fb8a892df6aca1e00aab67ab5e79e58b913e4f58cb9167af265225b3fbe9896d919256baa5008d12f3b97b3a37feb1
  edda7931d0effff8a3112297145a4f620dba218886c8c1083bed99ce3eb175bd7d80f275e4add0eb773f161a5d1fdf241904358816fe164f078654e4a32f821c
  6538d0bc644b98a9ddfd61e43a56d5f0cd0c2577444170dcdb303dcf7e17f73edb15a63ef060bd6a29512c282b6da08280d6030a406c4e10523ecc2eaf5e8321
)
b2sums=(
  76cbae6a5bbdffcbcf09ee8a6f04a9608c9d391fd29cdb2c84be420fbdaed60eba77960b2dead23887a68ed85cc3a9f9f09a5aa1222f3d97a5afba31bc995ff4
  11b956f3197e2ed50603b489e2c1e137323214b294e87b9856080bf7671f35e9fc049f574176eeb0d455402c170bff9f023fd7c7363b901b0766a51a11edfc00
  eec99f041baa3dac79649905cafbcb7729a610bf4d03b966d12c2c835ec56188ad34b7704508dfb54592a0e52017c1833c9ab558a41c93ab3129d9e204cdce18
)
b3sums=(
  474c40e380fea35b1339df4623ada0f81991944816a6cfab4af0d6d77a5ffd24
  4c0686b676542623aea0378b9b756b6c51666de977e4157d8d813ecb55d6d9c8
  d9f0d9108fe920281881b39a1b5ddadc76f831234934e9d59cd540bb020f2122
)

if [ "${CARCH}" != "x86_64" ]; then
  source=(
    "ch-remote::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote-static-${CARCH}"
    "cloud-hypervisor-static::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static-${CARCH}"
  )
  sha512sums=(
    c9a45bd50d14f04a5a0f05fdc7858877934f7704a5130927abf5fa26d84be5952d2d8591bd4ed7294a70458f5d58f6a71e8769812ff108d427f182ef2ffa4829
    1719e93b91138b1d8a8b62c65435094735967af9aaa65ae205be24117c055d45faeddac0af210c8a15943fab8a7504399bbd0fbfbf0aaf94cea22c330a234f82
  )
  b2sums=(
    f54f46727a817eaec1fd3cf83b50253c34879da43499b013f159d6181e94d93bc5db0023cbb80ad8c8eb541f65f1cf41d5c74baf8f5c09a19926cd21f2d7cb4d
    2bdf1b973641591243f2ab8bb540676ad61487c8de96bf87a8a896004af5b9657d85a0d1609ca049acd3eaac07ea472bb3e477c9a7d6140917f86b1c16914ed9
  )
  b3sums=(
    3e8466c372c6c20923787ad1ef7c1d38a86a6c548a552dfea105cdd1f222c5cd
    d3f4b5cc54f67c33040cdcb7b76de4326d72aec7f6813444bb7288de78677d72
  )
fi

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/ch-remote" \
    "${srcdir}/cloud-hypervisor-static"
  [ "${CARCH}" != "x86_64" ] || install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/cloud-hypervisor"
}
