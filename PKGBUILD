pkgname=astralrinth-app-bin
pkgver=0.10.304
pkgrel=1
pkgdesc="A fork of the Modrinth Launcher developed by didirus"
arch=('x86_64')
url="https://git.astralium.su/didirus/AstralRinth"
license=('GPL-3.0-only')
depends=('openssl-1.1' 'dbus' 'freetype2' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'libsoup3' 'webkit2gtk-4.1' 'libgl' 'libpulse' 'libx11' 'libxcursor' 'libxext' 'libxxf86vm')
optdepends=('xorg-xrandr: for older Minecraft versions')
options=('!strip' '!emptydirs' '!debug')
conflicts=('modrinth-app-bin' 'modrinth-app-git' 'modrinth-app' 'astralrinth-bin')
install=${pkgname}.install

source=(
  "AstralRinth_App_${pkgver}_amd64.deb::https://git.astralium.su/didirus/AstralRinth/releases/download/AR-${pkgver}/AstralRinth%20App_${pkgver}_amd64.deb"
  "astralrinth-app"
  "astralrinth-file-extensions.xml"
)

sha512sums=(
  '2a1747e7a70bdf467f77211827fa855b0d5c6d25e2675406cf77a5dc8f11be43f2b8df72cedc90936b924e5279441fd0c88dafc486183e29db16b6d75fbee98f'
  '9bd0a35204fb4bae20b0bec5382410556ce4eb3649c95b44fb6b4f852ac71526bace6a457d5f3e7c84e7959d24f9dc2a0c746af783d79c5d635b834991cec35a'
  '38fedb2532850677ff638d5c7e20fbc78efc18b5deb26f77dfcc079b42f48f16473f0a27d7af183ef02ad3cd94729c86249bdac60b2bc1b25b47a1ebd2ba0c0d'
)

prepare() {
  bsdtar -xf "${srcdir}/AstralRinth_App_${pkgver}_amd64.deb"
  tar -xf data.tar.*
}

package() {
  cd "$srcdir"
  install -Dm755 "usr/bin/ModrinthApp" "${pkgdir}/opt/astralrinth-app/astralrinth-app"
  install -Dm755 "astralrinth-app" "${pkgdir}/usr/bin/astralrinth-app"
  install -Dm644 "astralrinth-file-extensions.xml" "${pkgdir}/usr/share/mime/packages/astralrinth-file-extensions.xml"
  install -Dm644 "usr/share/applications/AstralRinth App.desktop" "${pkgdir}/usr/share/applications/astralrinth-app.desktop"
  sed -i -e 's|Exec=ModrinthApp|Exec=astralrinth-app %u|' -e 's|Icon=ModrinthApp|Icon=astralrinth-app|' "${pkgdir}/usr/share/applications/astralrinth-app.desktop"
  install -Dm644 "usr/share/icons/hicolor/128x128/apps/ModrinthApp.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/astralrinth-app.png"
}
