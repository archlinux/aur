# Maintainer: Meredith V. <justmere@proton.me>

pkgname=wrlcatcontrol-bin
pkgver=1.1.3
pkgrel=1
pkgdesc="World Radio League CAT Control application"
arch=('x86_64')
url="https://worldradioleague.com"
license=('LicenseRef-upstream-proprietary')

depends=(
  'java-runtime'
  'libusb'
  'glibc'
  'gcc-libs'
  'lib32-glibc'
  'lib32-gcc-libs'
  'gtk3'
  'nss'
  'libxss'
  'libxtst'
  'at-spi2-core'
  'libdrm'
  'alsa-lib'
)

optdepends=(
  'hamlib: CAT control backend support'
)

provides=('wrlcatcontrol')
conflicts=('wrlcatcontrol')

source=(
  "WRLCatControl_${pkgver}_Linux.deb::https://storage.googleapis.com/world-radio-league-prod.appspot.com/CatControl/WRLCatControl_${pkgver}_Linux.deb"
)

sha256sums=(
  'SKIP'
)

package() {
  cd "${srcdir}"

  # Extract Debian package
  bsdtar -xf "WRLCatControl_${pkgver}_Linux.deb"

  # Extract filesystem contents
  bsdtar -xf data.tar.xz -C "${pkgdir}"

  # Ensure binaries are executable
  find "${pkgdir}/usr/bin" -type f -exec chmod 755 {} \; 2>/dev/null || true

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << EOF
WRLCatControl is proprietary software.

For licensing terms and usage restrictions, see the upstream developer:

https://worldradioleague.com
EOF
}
