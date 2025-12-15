# Maintainer: Stephen Paul <stephen at lun1xr dot live>
pkgname=ply-mksplash
pkgver=1.0.3
pkgrel=3
pkgdesc='Plymouth bootsplash animation generator. Supports framerates other than 30 fps by patching two-step.'
url='https://github.com/lun1xr/plymouth-splash-genpatch'
arch=('x86_64')
license=('0BSD')
depends=(
  plymouth
  bash
  sudo
  ffmpeg
)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)

b2sums=('6668b0d32390d03c9fe5a3df3350767cf2520ff2ef8bd2862e7f917bc133fe4f4848a0348b80e0708036180d88cbf5b61f92d841144809318fb03ae364eabf61')

package() {

  cd "${srcdir}/plymouth-splash-genpatch-${pkgver}"

  install -Dm644 "/dev/null" "${pkgdir}/usr/share/ply-mksplash/.conf"
  # Install scripts
  install -Dm755 "mksplash"       "${pkgdir}/usr/bin/mksplash"
  install -Dm755 "patch-helper"   "${pkgdir}/usr/bin/patch-helper"

  # Install units
  install -Dm644 "mksplash-theme-change.path"    "${pkgdir}/usr/lib/systemd/system/mksplash-theme-change.path"
  install -Dm644 "mksplash-theme-change.service" "${pkgdir}/usr/lib/systemd/system/mksplash-theme-change.service"

  # Install license
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install assets directory
  cp -rT "assets-req" "${pkgdir}/usr/share/${pkgname}"
}
