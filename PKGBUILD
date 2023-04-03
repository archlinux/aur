# Maintainer: chung <me@chungn.com>
pkgname=sunshine-bin
pkgver=0.19.0
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
sha256sums_x86_64=('8c93127bda4704dd65e24dfc62ed89ce0148d87c7fe96680d3413aa015a1843c')

package() {
  cd "$srcdir/"

  install -Dm755 "usr/bin/sunshine" "${pkgdir}/usr/bin/sunshine"
  install -Dm755 "usr/bin/sunshine-v${pkgver}" "${pkgdir}/usr/bin/sunshine-${pkgver}"

  install -Dm644 "usr/lib/systemd/user/sunshine.service" "${pkgdir}/usr/lib/systemd/user/sunshine.service"
  install -Dm644 "usr/lib/udev/rules.d/85-sunshine.rules" "${pkgdir}/usr/lib/rules.d/85-sunshine.rules"

  mkdir -p "${pkgdir}/usr/share/sunshine"
  cp -r "usr/share/sunshine" "${pkgdir}/usr/share/"
}
