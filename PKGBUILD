# Maintainer: Nikos Toutountzoglou <nikos dot toutou at protonmail dot com>

pkgname=curseforge-bin
_pkgname=${pkgname%-bin}
_app="CurseForge"
pkgver=1.290.0.28665
pkgrel=1
pkgdesc="Download and manage your addons, custom content, and mods with the CurseForge app"
arch=('x86_64')
url="https://curseforge.overwolf.com"
license=('LicenseRef-Overwolf-Website-Terms-of-Use')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libx11'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'zlib-ng-compat'
)
optdepends=('libappindicator-gtk3: To show a system tray icon')
source=("${pkgname}-${pkgver}.deb::https://curseforge.overwolf.com/downloads/${_pkgname}-latest-linux.deb"
        "LICENSE")
sha256sums=('ed6315af65ca4d1cc10e9be29f1b27efb5744a53d5f779e4fb4cf902f5695b21'
            '940e1e7b066c07fcba7d3435d99e817283d18e38c0f9cfd6d89405827fde04d5')
options=(!strip !debug)
conflicts=('curseforge')

package() {
  # Create /usr/bin directory
  install -dm755 "${pkgdir}/usr/bin"

  # Extract the .deb file
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.deb" -C "${srcdir}"

  # Extract data.tar.* into $pkgdir
  bsdtar -xf "${srcdir}/data.tar."* -C "${pkgdir}"

  # Install the custom license file
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Create a symbolic link to the binary
  ln -sf "/opt/${_app}/curseforge" "${pkgdir}/usr/bin/curseforge"
}

# vim: set ts=2 sw=2 et:
