# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=19.0
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
  4ec3e7789a56fccf2eee169b25b6c874c095dc43085af70916a3e8253b0587782ed443a283992903eec91b2cc65af7317b5934a51644330c2153abb45b2ffa0a
  d11da6ddefa668a4cced43adf3aeb2779b055ff93ec7b0bb4d0296d5ff988572882f024496aecd90da065462af8d57d9695f7ecf299aa3430988c73f92fef5b5
  c96e0c85e003af4756cfd54f2d3140b37042b0839a62f26828b312edde2461a1b932303fa7d22fd6d58e779e62779b4c74331543777039e9869f8539cd7dfa58
)
b2sums=(
  b0edc4b5f5c8f5bb162972eac2048ea94544f2c453cf02d2697ef8676ff57c0c723d4760f35b4bce0b632158b5c8323eb34ddf784bff06d44350b508ccd96311
  5797b948c7950bdac890c3bb6b5edf330fd2a3ac7e2e778043e44298fa79029ac7eb5f6b15b20745e854a880bdfc2dede4e1932b4429f1911bb019038b610fda
  8240bed0bdc779b150575e26a3c0c4c0a25f04cf32e9401972854264d5be8eadfc263007be73ae046f3d305b03c9d695442f6fe3fa14b6c1675501d46249a65c
)
b3sums=(
  910223d6a101cae5398af0fad8e91fa7e2e66296c44c3acfed57aee6673878f6
  907968c0c855649331717b5bcccc321290ff74046313bf408f90e4b339f950ed
  2dccfb09e071e972fb24865ccb9241e14cea84dd7a02d95f7a02f44f0b0b77c5
)

if [ "${CARCH}" != "x86_64" ]; then
  source=(
    "ch-remote::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote-static-${CARCH}"
    "cloud-hypervisor-static::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static-${CARCH}"
  )
  sha512sums=(
    4ec3e7789a56fccf2eee169b25b6c874c095dc43085af70916a3e8253b0587782ed443a283992903eec91b2cc65af7317b5934a51644330c2153abb45b2ffa0a
    c96e0c85e003af4756cfd54f2d3140b37042b0839a62f26828b312edde2461a1b932303fa7d22fd6d58e779e62779b4c74331543777039e9869f8539cd7dfa58
  )
  b2sums=(
    b0edc4b5f5c8f5bb162972eac2048ea94544f2c453cf02d2697ef8676ff57c0c723d4760f35b4bce0b632158b5c8323eb34ddf784bff06d44350b508ccd96311
    8240bed0bdc779b150575e26a3c0c4c0a25f04cf32e9401972854264d5be8eadfc263007be73ae046f3d305b03c9d695442f6fe3fa14b6c1675501d46249a65c
  )
  b3sums=(
    910223d6a101cae5398af0fad8e91fa7e2e66296c44c3acfed57aee6673878f6
    2dccfb09e071e972fb24865ccb9241e14cea84dd7a02d95f7a02f44f0b0b77c5
  )
fi

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/ch-remote" \
    "${srcdir}/cloud-hypervisor-static"
  [ "${CARCH}" != "x86_64" ] || install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/cloud-hypervisor"
}
