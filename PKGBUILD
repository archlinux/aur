# See contacts at https://aur.archlinux.org/cgit/aur.git/tree/README.md?h=antra-bin

pkgname=antra-bin
_pkgname=antra
__pkgname=Antra
pkgver=1.1.8
pkgrel=2
pkgdesc="A desktop music library builder that supports Spotify, YouTube Music, Apple Music, Amazon Music, Tidal, Qobuz, and Deezer"
arch=("x86_64")
url="https://github.com/anandprtp/Antra"
license=("Elastic-2.0")
depends=('glib2' 'webkit2gtk-4.1' 'gtk3' 'gdk-pixbuf2' 'libsoup3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("https://github.com/anandprtp/Antra/releases/download/v${pkgver}/${__pkgname}-Linux.AppImage")
sha256sums=('83ec796a9ffa9ea75e55c71d575933de4060f72e9f6e9957229fae06bef9efdd')

prepare() {
  chmod +x "${__pkgname}-Linux.AppImage"

  "./${__pkgname}-Linux.AppImage" --appimage-extract
}

package() {
  mkdir -vp "${pkgdir}/usr/bin"
  cp -v --no-preserve=ownership --preserve=mode "squashfs-root/usr/bin/${__pkgname}" "${pkgdir}/usr/bin/"

  mkdir -vp "${pkgdir}/usr/share/applications"
  cp -v --no-preserve=ownership --preserve=mode "squashfs-root/usr/share/applications/${__pkgname}.desktop" "${pkgdir}/usr/share/applications/"

  mkdir -vp "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  cp -v --no-preserve=ownership --preserve=mode "squashfs-root/usr/share/icons/hicolor/512x512/apps/${__pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/"
}
