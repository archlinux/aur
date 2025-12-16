# Maintainer: Stephen Paul <stephen at lun1xr dot live>
pkgname=ply-mksplash
pkgver=1.0.4
pkgrel=4
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

b2sums=('ef117e9f269a3db419a628789c07adf5089f1aee82f0ea243312bc8f3cc9979b286347ca96a04415d57b452bf11767b86a7fdf844c072f0fd653057a79dd52ef')

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
