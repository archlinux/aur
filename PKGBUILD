# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=18.0
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
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor"
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote"
  "https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static"
)
sha512sums=(
  2e6cac8f17fad7cd37cb7650c58080c17b201cf030e1cecdbf5de39dbc51752e3eb6b4a453dcbf336893f58130bc73f4ebcbeada0f8546f870c21ea3934c214e
  d76566b04834988aa100acb2d7c71a4f57e440405a51c71bf35f05c4b99acb8e9404a18769fda907762d86e93c1888a1260f0c4ad4b1efc64001feac6fed66fd
  9b1c0993f87ff23b3e1e2c9d8bb2009e3004690df723cdda3b98d5b341ee669fb8937c6661b8e63685bb3e796a9d7f2108f999f25f12595440648101d1dd9492
)
b2sums=(
  8e153a90ac247140a4040987e494308da981d592a61cb19b37bc9c95ac24e15da2fbfbc25c896fd5e496b568a2bfc7047ad4e880bbb1cc069951c1f035777334
  05a006cbbdc3dad52f3383f7723519a55b2361b747549b4238b67579e1e04a2ae1bcac768a982fda0a25f231db82ff29bba863b307eb6c07c879ac4277eee2af
  660e9978a73be5a9254735b5cdf4ab64691b3e42a91346d7cd78fb1145c1ec43d01f7952729369c075c3b93409f55026de9c07e7e7e7bd258c4c7954f437bf7d
)
b3sums=(
  c059fd14855eeee7c758cfeefc415c741290c561ce51e21c1e1981aa753cc5a9
  8ebe9cd9ce110e65675bb91f1ccf985d07f6dd048d3b62dc11fc60e09e266a13
  740c364181576a2458fd9a16854f035157d8adb84dc9914e3f66dddc67d23bc8
)

if [ "${CARCH}" != "x86_64" ]; then
  source=(
    "ch-remote::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote-static-${CARCH}"
    "cloud-hypervisor-static::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static-${CARCH}"
  )
  sha512sums=(
    7c6b81988cac8968b8901e021a8f473bf6e6575e14bfef62f10e23a42b440e693f8ec648cfd3378be5b2e3b02774999cd4beacc26c28d1c7add1f39e4108a1ff
    4384845c93deb78367f9209ef84f7b4cc49a4c9344ad5a92417045fd261da4578a3a1855301dd478352ed1f13671cba0a3f3becea983819515544cee6d24aa4b
  )
  b2sums=(
    9519e3efa313ce2ee0abe063cd1fb15b6837faa5ce79ccef8dc9651f3d1aff77ee4ece201bb72c3a2545056f582a8181906e6a8431c0b40a17b2bca923f4fdaf
    737a70fa5302eb3f6c63bc7435cad21a956b11e9c39d083578c54b80dd177bdc1f18f271e35cd28de6aeea79bccec80fa9c6b68203a86bdee0e718f537d06ab1
  )
  b3sums=(
    cfe7a33f584f8e139b59f2aa4c4fa37cc38d53540a443f08253f8026e909884d
    926215d3ee8d9521378d4962cffd0e700deed1f0529d2626fd7fa134124ad7c1
  )
fi

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/ch-remote" \
    "${srcdir}/cloud-hypervisor-static"
  [ "${CARCH}" != "x86_64" ] || install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/cloud-hypervisor"
}
