# Maintainer: chung <me@chungn.com>
pkgname=sunshine-bin
pkgver=0.18.4
pkgrel=1
pkgdesc='A self-hosted GameStream host for Moonlight (prebuilt version).'
url='https://github.com/LizardByte/Sunshine'
source_x86_64=("https://github.com/LizardByte/Sunshine/releases/download/v$pkgver/sunshine.pkg.tar.zst")
arch=('x86_64')
license=('GPL3')
depends=('avahi' 'boost-libs' 'curl' 'libevdev' 'libmfx' 'libpulse' 'libva' 'libvdpau' 'libx11' 'libxcb' 'libxfixes' 'libxrandr' 'libxtst' 'numactl' 'openssl' 'opus' 'udev')
optdepends=('cuda: NvFBC capture support'
            'libcap'
            'libdrm')
conflicts=('sunshine' 'sunshine-git')
provides=('sunshine')
sha256sums_x86_64=('defa74086f371d3ee86315fd0bf2864a64b78db5e3948877a3d438005e8e7f0f')

package() {
  cd "$srcdir/"

  install -Dm755 "usr/bin/sunshine" "${pkgdir}/usr/bin/sunshine"
  install -Dm755 "usr/bin/sunshine-${pkgver}" "${pkgdir}/usr/bin/sunshine-${pkgver}"

  install -Dm644 "usr/lib/systemd/user/sunshine.service" "${pkgdir}/usr/lib/systemd/user/sunshine.service"
  install -Dm644 "usr/lib/udev/rules.d/85-sunshine.rules" "${pkgdir}/usr/lib/rules.d/85-sunshine.rules"

  mkdir -p "${pkgdir}/usr/share/sunshine"
  cp -r "usr/share/sunshine" "${pkgdir}/usr/share/"
}