# Maintainer: chung <me@chungn.com>
pkgname=sunshine-bin
pkgver=0.19.1
pkgrel=3
pkgdesc='A self-hosted GameStream host for Moonlight (prebuilt version).'
url='https://github.com/LizardByte/Sunshine'
source_x86_64=("https://github.com/LizardByte/Sunshine/releases/download/v$pkgver/sunshine.pkg.tar.zst")
arch=('x86_64')
license=('GPL3')
depends=('avahi' 'boost-libs' 'curl' 'libevdev' 'libmfx' 'libpulse' 'libva' 'libvdpau' 'libx11' 'libxcb' 'libxfixes' 'libxrandr' 'libxtst' 'numactl' 'openssl' 'opus' 'udev' 'libappindicator-gtk3')
optdepends=('cuda: NvFBC capture support'
            'libcap'
            'libdrm')
conflicts=('sunshine' 'sunshine-git')
provides=('sunshine')
sha256sums_x86_64=('ea159c8f5c13471cde0028443f48201bc747e9ea5b898e6dca91eb5043010723')

package() {
  cd "$srcdir/"

  install -Dm755 "usr/bin/sunshine" "${pkgdir}/usr/bin/sunshine"
  install -Dm755 "usr/bin/sunshine-v${pkgver}" "${pkgdir}/usr/bin/sunshine-${pkgver}"

  install -Dm644 "usr/lib/systemd/user/sunshine.service" "${pkgdir}/usr/lib/systemd/user/sunshine.service"
  install -Dm644 "usr/lib/udev/rules.d/85-sunshine.rules" "${pkgdir}/usr/lib/rules.d/85-sunshine.rules"

  mkdir -p "${pkgdir}/usr/share/sunshine"
  cp -r "usr/share/sunshine" "${pkgdir}/usr/share/"
}
