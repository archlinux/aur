# Maintainer: Christoph Brandau <c.brandau91@googlemail.com>

pkgname=gitty-desktop-bin
pkgver=2026.8.4
pkgrel=1
pkgdesc="A lightweight, modern Git client built with Tauri (prebuilt AppImage)"
arch=('x86_64')
url="https://git.cbsk-tech.de/Christoph/GitLite"
license=('MIT')
depends=('fuse2' 'git' 'webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'librsvg' 'xdotool')
provides=('gitty-desktop')
conflicts=('gitty-desktop')
options=('!strip')

_appimage="Gitty_2026.8.4_amd64.AppImage"
_artifact_url="https://git.cbsk-tech.de/Christoph/GitLite/releases/download/2026.8.4/Gitty_2026.8.4_amd64.AppImage"
_tag=2026.8.4
source=("${_appimage}::${_artifact_url}"
        "gitty-desktop.png::${url}/raw/tag/${_tag}/src-tauri/icons/icon.png")
sha256sums=('53c57b6a31622f3a4be10d2f310adfda7601fb44ea5f506aec488762159ba4e5'
            'ef03b4ec9b111c938f7e23feaaef39dfa2d1bc7c934076529e81266e0d8a2606')

package() {
  install -Dm755 "$srcdir/$_appimage" \
    "$pkgdir/opt/$pkgname/gitty-desktop.AppImage"
  install -d "$pkgdir/usr/bin"
  ln -s "/opt/$pkgname/gitty-desktop.AppImage" \
    "$pkgdir/usr/bin/gitty-desktop"

  install -Dm644 "$srcdir/gitty-desktop.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/gitty-desktop.png"

  install -d "$pkgdir/usr/share/applications"
  cat > "$pkgdir/usr/share/applications/gitty-desktop.desktop" <<-EOF
	[Desktop Entry]
	Type=Application
	Name=Gitty
	Comment=$pkgdesc
	Exec=gitty-desktop
	Icon=gitty-desktop
	Terminal=false
	Categories=Development;RevisionControl;
	StartupWMClass=gitty
	EOF
}
