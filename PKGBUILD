#Maintainer: AEnterprise <aenterprise@gearbot.rocks>
pkgname=warp-terminal
pkgver=0.2024.04.16.08.02.stable_00
pkgrel=1
pkgdesc="Warp, the Rust-based terminal for developers and teams"
license=('custom')

arch=('x86_64')
source=("https://releases.warp.dev/stable/v${pkgver}/warp-terminal-v${pkgver}-1-x86_64.pkg.tar.zst")
md5sums=('7b280c693443d3eb6883018167d70c0d')
depends=(
curl
default-cursors
fontconfig
libegl
libx11
libxcb
libxcursor
libxi
libxkbcommon-x11
opengl-driver
xdg-utils
zlib
)
optdepends=(
'adwaita-cursors: for if there is no default cursor installed'
'zenity: for file dialogs in Gnome'
'kdialog: for file dialogs in KDE'
'org.freedesktop.secrets: for securely storing passwords'
)
provides=("$pkgname")

prepare() {
    mv warp-terminal-v${pkgver}-1-x86_64.pkg.tar.zst ${pkgname}_${pkgver}.pkg.tar.zst
    mkdir ${pkgname}-${pkgver}
    tar -xf ${pkgname}_${pkgver}.pkg.tar.zst --directory="${pkgname}-${pkgver}"
}


package() {
    cd "$pkgname-${pkgver}"

  install -Dm644 -d opt/warpdotdev/warp-terminal/ /opt/warpdotdev/warp-terminal
  install -Dm644 -d usr/share/icons/hicolor /usr/share/icons/hicolor
  install -Dm644 usr/share/bin/warp-terminal /usr/share/applications/bin/warp-terminal
  install -Dm644 usr/share/applications/dev.warp.Warp.desktop /usr/share/applications/dev.warp.Warp.desktop

}
