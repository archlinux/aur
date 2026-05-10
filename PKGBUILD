# Maintainer: Meredith V. <delightful.device@pm.me>

pkgname=world-radio-league-desktop-bin
pkgver=0.0.5
pkgrel=1
pkgdesc="World Radio League desktop application"
arch=('x86_64')
url="https://worldradioleague.com"
license=('LicenseRef-upstream-proprietary')

depends=(
  'gtk3'
  'libnotify'
  'nss'
  'libxss'
  'libxtst'
  'at-spi2-core'
  'util-linux-libs'
  'libsecret'
  'make'
  'alsa-lib'
)

provides=('world-radio-league-desktop')
conflicts=('world-radio-league-desktop')

source=(
  "world-radio-league-desktop_${pkgver}_amd64.deb::https://auth.worldradioleague.com/storage/v1/object/public/public-uploads/desktop-updates/stable/world-radio-league-desktop_${pkgver}_amd64.deb"
)

sha256sums=(
  'SKIP'
)

package() {
  cd "${srcdir}"

  # Extract Debian package
  bsdtar -xf "world-radio-league-desktop_${pkgver}_amd64.deb"

  # Extract filesystem contents
  bsdtar -xf data.tar.xz -C "${pkgdir}"

  # Ensure binaries are executable
  find "${pkgdir}/usr/bin" -type f -exec chmod 755 {} \; 2>/dev/null || true

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"

  cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" << EOF
world-radio-league-desktop is proprietary software.

For licensing terms and usage restrictions, see the upstream developer:

https://worldradioleague.com
EOF
}
