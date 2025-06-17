# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>

# URL for the latest release
_url="$(curl -s "https://api.github.com/repos/RPCS3/rpcs3-binaries-linux/releases/latest" | awk -F'"' '/browser_download_url.*rpcs3.*AppImage/ {print $4}')"
# Build ID
_build="$(echo $_url | awk -F '[-/]' '{print $11}')"
# AppImage version
_pkgver="$(echo $_url | awk -F '[-_]' -v OFS='-' '{gsub("v", "", $5); print $5,$6,$7}')"

pkgname=rpcs3-bin
# Overwrited the "-" for "_" as instructed on the ArchWiki. It will change dynamically
# everytime there is a new release. It just need to be recompiled.
pkgver="$(echo $_url | awk -F '[-_]' -v OFS='_' '{gsub("v", "", $5); print $5,$6,$7}')"
pkgrel=1
pkgdesc='Open-source Sony PlayStation 3 Emulator'
arch=('x86_64')
url='https://rpcs3.net/'
license=('GPL2')
depends=(
  'glew'
  'jack'
  'openal'
  'opencv'
  'qt6-base'
  'qt6-multimedia'
  'qt6-svg'
  'sdl3'
  'sndio'
)
optdepends=('libglvnd')
options=('!strip')
replaces=('rpcs3')
provides=('rpcs3')
conflicts=('rpcs3')
source=("https://github.com/RPCS3/rpcs3-binaries-linux/releases/download/build-$_build/rpcs3-v${_pkgver}_linux64.AppImage")
sha256sums=('SKIP')

prepare()
{
    cd "$srcdir"

    chmod +x "$srcdir/rpcs3-v${_pkgver}_linux64.AppImage"
    "$srcdir/rpcs3-v${_pkgver}_linux64.AppImage" --appimage-extract
}

package()
{
    cd "${srcdir}/AppDir"

    install -D -m755 'usr/bin/rpcs3' "$pkgdir/usr/bin/rpcs3"
    install -D -m644 'usr/share/applications/rpcs3.desktop' "$pkgdir/usr/share/applications/rpcs3.desktop"
    install -D -m644 'usr/share/icons/hicolor/48x48/apps/rpcs3.png' "$pkgdir/usr/share/icons/hicolor/48x48/apps/rpcs3.png"
    install -D -m644 'usr/share/icons/hicolor/scalable/apps/rpcs3.svg' "$pkgdir/usr/share/icons/hicolor/scalable/apps/rpcs3.svg"
    install -D -m644 'usr/share/metainfo/rpcs3.metainfo.xml' "$pkgdir/usr/share/memetainfo/rpcs3.metainfo.xml"
    install -D -m644 'usr/share/rpcs3/Icons/ui/circle.png' "$pkgdir/usr/share/rpcs3/Icons/ui/circle.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/cross.png' "$pkgdir/usr/share/rpcs3/Icons/ui/cross.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/dpad_down.png' "$pkgdir/usr/share/rpcs3/Icons/ui/dpad_down.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/dpad_left.png' "$pkgdir/usr/share/rpcs3/Icons/ui/dpad_left.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/dpad.png' "$pkgdir/usr/share/rpcs3/Icons/ui/dpad.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/dpad_right.png' "$pkgdir/usr/share/rpcs3/Icons/ui/dpad_right.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/dpad_up.png' "$pkgdir/usr/share/rpcs3/Icons/ui/dpad_up.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/fade_bottom.png' "$pkgdir/usr/share/rpcs3/Icons/ui/fade_bottom.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/fade_top.png' "$pkgdir/usr/share/rpcs3/Icons/ui/fade_top.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/L1.png' "$pkgdir/usr/share/rpcs3/Icons/ui/L1.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/L2.png' "$pkgdir/usr/share/rpcs3/Icons/ui/L2.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/left_stick.png' "$pkgdir/usr/share/rpcs3/Icons/ui/left_stick.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/new.png' "$pkgdir/usr/share/rpcs3/Icons/ui/new.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/R1.png' "$pkgdir/usr/share/rpcs3/Icons/ui/R1.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/R2.png' "$pkgdir/usr/share/rpcs3/Icons/ui/R2.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/right_stick.png' "$pkgdir/usr/share/rpcs3/Icons/ui/right_stick.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/save.png' "$pkgdir/usr/share/rpcs3/Icons/ui/save.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/select.png' "$pkgdir/usr/share/rpcs3/Icons/ui/select.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/spinner-24.png' "$pkgdir/usr/share/rpcs3/Icons/ui/spinner-24.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/square.png' "$pkgdir/usr/share/rpcs3/Icons/ui/square.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/start.png' "$pkgdir/usr/share/rpcs3/Icons/ui/start.png"
    install -D -m644 'usr/share/rpcs3/Icons/ui/triangle.png' "$pkgdir/usr/share/rpcs3/Icons/ui/triangle.png"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/Classic (Bright).qss' "$pkgdir/usr/share/rpcs3/GuiConfigs/Classic (Bright).qss"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/Darker Style by TheMitoSan.qss' "$pkgdir/usr/share/rpcs3/GuiConfigs/Darker Style by TheMitoSan.qss"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/Envy.qss' "$pkgdir/usr/share/rpcs3/GuiConfigs/Envy.qss"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/kot-bg.jpg' "$pkgdir/usr/share/rpcs3/GuiConfigs/kot-bg.jpg"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/Kuroi (Dark) by Ani.qss' "$pkgdir/usr/share/rpcs3/GuiConfigs/Kuroi (Dark) by Ani.qss"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/list_arrow_blue.png' "$pkgdir/usr/share/rpcs3/GuiConfigs/list_arrow_blue.png"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/list_arrow_down_blue.png' "$pkgdir/usr/share/rpcs3/GuiConfigs/list_arrow_down_blue.png"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/list_arrow_down_green.png' "$pkgdir/usr/share/rpcs3/GuiConfigs/list_arrow_down_green.png"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/list_arrow_down_white.png' "$pkgdir/usr/share/rpcs3/GuiConfigs/list_arrow_down_white.png"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/list_arrow_green.png' "$pkgdir/usr/share/rpcs3/GuiConfigs/list_arrow_green.png"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/list_arrow_white.png' "$pkgdir/usr/share/rpcs3/GuiConfigs/list_arrow_white.png"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/ModernBlue Theme by TheMitoSan.qss' "$pkgdir/usr/share/rpcs3/GuiConfigs/ModernBlue Theme by TheMitoSan.qss"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/Nekotekina by GooseWing.qss' "$pkgdir/usr/share/rpcs3/GuiConfigs/Nekotekina by GooseWing.qss"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/Skyline (Nightfall).qss' "$pkgdir/usr/share/rpcs3/GuiConfigs/Skyline (Nightfall).qss"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/Skyline.qss' "$pkgdir/usr/share/rpcs3/GuiConfigs/Skyline.qss"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/YoRHa-background.jpg' "$pkgdir/usr/share/rpcs3/GuiConfigs/YoRHa-background.jpg"
    install -D -m644 'usr/share/rpcs3/GuiConfigs/YoRHa by Ani.qss' "$pkgdir/usr/share/rpcs3/GuiConfigs/YoRHa by Ani.qss"
}
