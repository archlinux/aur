# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="mydict-bin"
pkgver=0.6.14
pkgrel=1
pkgdesc='一款中英文词典'
arch=(x86_64)
url="https://github.com/xxNull-lsk/my_dict"
license=('custom:BSD-3-Clause')
options=(!strip)
depends=('qt5-websockets' 'libsm' 'mtdev' 'ncurses' 'qt5-declarative' 'libgcrypt' 'gstreamer' 'libvorbis' 'libxkbcommon' 'sqlite' \
    'krb5' 'bzip2' 'sh' 'libxkbcommon-x11' 'dbus' 'xcb-util-keysyms' 'libbsd' 'libxcomposite' 'libgpg-error' 'zlib' 'pango' 'libxcb' \
    'qt5-svg' 'libpulse' 'e2fsprogs' 'qt5-wayland' 'orc' 'libxdamage' 'libcap' 'gst-plugins-base-libs' 'xcb-util-renderutil' 'libice' \
    'libdrm' 'libxinerama' 'libevdev' 'gcc-libs' 'systemd-libs' 'fontconfig' 'xz' 'libxtst' 'libx11' 'libxi' 'libsndfile' 'libxext' \
    'xcb-util-image' 'glib2' 'libxfixes' 'libxrender' 'alsa-lib' 'libxcursor' 'libxcrypt-compat' 'at-spi2-core' 'gdk-pixbuf2' 'libpng' \
    'qt5-base' 'lz4' 'graphite' 'libglvnd' 'libinput' 'cairo' 'libogg' 'freetype2' 'libdatrie' 'zstd' 'wayland' 'libthai' 'glibc' \
    'libxrandr' 'expat' 'util-linux-libs' 'libgudev' 'libasyncns' 'xcb-util-wm' 'qt5-multimedia' 'gtk3' 'fribidi' 'openssl-1.1' 'keyutils' \
    'pixman' 'harfbuzz' 'libepoxy')
optdepends=()
makedepends=('gendesk')
noextract=("${pkgname%-bin}-${pkgver}.tar.gz")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_arch_linux_x64_${pkgver}.tar.gz")
sha256sums=('505769645eed49ed19d6fd39dd5a1c8fd5b9bef8f262b34a45fbb03d7265e66d')
package() {
    install -Dm755 -d "${pkgdir}/opt"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.tar.gz" -C "${pkgdir}/opt" --gname root --uname root
    gendesk --exec "/opt/${pkgname%-bin}/${pkgname%-bin}" --categories "Utility" --name "MyDict" --icon "${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/res/dict.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/cryptography-3.4.8-py3.7.egg-info/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}