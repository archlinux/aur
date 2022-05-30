# Maintainer: zer0def <zer0def@github>
pkgname=cloud-hypervisor-bin
pkgver=24.0
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
sha512sums=('1bb5d37fb02555c3a4af091c340cb6a62a8b8e6f0bb8ec6d6ecf3550a68d6e2e4f67a788f26b8f0cc23574353877beb52509b3409e5d5f71d4b21e2b2f10e2ca'
            '48a782e0f799e85e6c7577e131a769d83c77b89848a7d64699f84f9484a51a393d2e94996ea18cefe0bcfbf8d7c0cb1bcdd63516a29432a9ee7787b2a9c89aa9'
            '321c26091481305d4e64bbe2ced8f060e19b01f23e2f01110e529c555e8439388e710186c17ad49a4b8aac9dda62e9d0140e3f5920c7978f142e2d697f6238ee')
b2sums=('ed1842b6096ee9c763e9db451d638680ccad537f3aac0b2769655cc4da764cb8871cabf5147434ef81b225e3f5011e1eca26d7a07029732b23507d574d29deb8'
        'a025915a13f4f31bc6f2c5f1c9045d0e0dbac0a30ae95835aeaf4d02651b0a62befdc45337fcbfe7dcde78a8ea53f0922775e0f19a7a69112997fc3b2603a53e'
        'ef0e7373d12c369d315b44213b5dedd45c00189a67f7ab28a4b82f389650c887ae986a5e2cfdf21ada70e9d3245292ef27dc7190f2a584a04a20dc32a4cc85e7')

if [ "${CARCH}" != "x86_64" ]; then
  source=(
    "ch-remote::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/ch-remote-static-${CARCH}"
    "cloud-hypervisor-static::https://github.com/cloud-hypervisor/cloud-hypervisor/releases/download/v${pkgver}/cloud-hypervisor-static-${CARCH}"
  )
  sha512sums=('8e7e314e2654864746aec20aa94a139fc19a0bd091b7210381d020a6ab380ea377a150bd26f691059255de033c1e6c8b3e9d0faede6caab3765d049b3e1bec1c'
            '4902037f0b702f61968b596cfbaa88fef2a543d26a9277e6d338d35db7fdec577d520447ea86ba8a21a5c9ae2c8412955c6c1a930dcd6f0ae38293c478ffcb52')
  b2sums=('33019a41a7ec2e0521f2722780a0ae711e50dacaa19521b2e604d4c10ce1f618b94e2be4140f71c7366856ea5237809df74005721b88018f54237ee4935e0266'
        'e1ed9fed2a8a15cf9969fcaea4b0b38780d1926e2f974d31ba8eb646ebaefbab9315359153cf2000bfba924ab3c9b06b4c47b6d7f35eebef258638cc3d6ad5cb')
fi

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" \
    "${srcdir}/ch-remote" \
    "${srcdir}/cloud-hypervisor-static"
  [ "${CARCH}" != "x86_64" ] || install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/cloud-hypervisor"
}
