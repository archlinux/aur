# Maintainer: jwr1

pkgname=interstellar-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='An app for Mbin and Lemmy, connecting you to the fediverse.'
arch=(x86_64 aarch64)
url=https://github.com/jwr1/interstellar
license=(GPL-3.0-only)
depends=(gtk3 xdg-user-dirs mpv)
provides=(interstellar)
conflicts=(interstellar)
source_x86_64=("${url}/releases/download/v${pkgver}/interstellar-linux-x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/interstellar-linux-aarch64.tar.gz")
sha256sums_x86_64=('db850e8614322dcccd75aaec8b2fb8d9796cbaaa30ab9f2cf94112c002e7c2c9')
sha256sums_aarch64=('b94f4fa9742ae0c6f739b2a21f4bef60224842dd9f1daf4ec8fea3ed7ababc50')

package() {
  # Setup directories
  install -dm755 "${pkgdir}/usr/share/interstellar"
  install -dm755 "${pkgdir}/usr/bin"

  # Copy .desktop and icon
	install -Dm644 "${startdir}/interstellar.desktop" "${pkgdir}/usr/share/applications/interstellar.desktop" 
  install -Dm644 "${srcdir}/data/flutter_assets/assets/icons/logo.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/interstellar.png"

  # Copy app files
	cp -r "${srcdir}/." "${pkgdir}/usr/share/interstellar/"

  # Link executable
  ln -s "/usr/share/interstellar/interstellar" "${pkgdir}/usr/bin/interstellar"
}
