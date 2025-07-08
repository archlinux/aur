# Maintainer: Rakesh KP <rakeshkpk@gmail.com>
pkgname=symphonie-bin
pkgver=1.0.15
pkgrel=8 # Final version number for this fix
pkgdesc="A lightweight music player for local audio collection."
arch=('x86_64')
url="https://github.com/kprakesh1984/symphonie"
license=('MIT')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libsecret')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")

source=("https://github.com/kprakesh1984/symphonie/releases/download/linux-aur-release-v${pkgver}/symphonie-${pkgver}.tar.gz"
        "symphonie.desktop"
        "512x512.png")

sha256sums=('f35f6a4c3f37e15a47197e8f44426303d158b3c7ca41b42bea74c0ef3757b2f1'
            '0fc89a411f6c4c0b5881d2fad4bb5e5e4a24775664b2a44014493ae7acbd3031'
            '66d1d7932ff2c541ace259eca426f8557c4f5853f416562b2162d69e6b69b122')

package() {
  # Install the main application files
  install -d "${pkgdir}/opt/${pkgname%-bin}"

  # --- THE DEFINITIVE FIX IS HERE ---
  # This command copies all extracted source files robustly.
  # It changes into the source directory first, then copies everything.
  cd "${srcdir}"
  cp -a * "${pkgdir}/opt/${pkgname%-bin}/"

  # This chmod command will now find its target and succeed.
  chmod +x "${pkgdir}/opt/${pkgname%-bin}/Symphonie"

  # Install the .desktop file and icon (these paths are now correct)
  install -Dm644 "${srcdir}/symphonie.desktop" "${pkgdir}/usr/share/applications/symphonie.desktop"
  install -Dm644 "${srcdir}/512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/symphonie.png"
}
