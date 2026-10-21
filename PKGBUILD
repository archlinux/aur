# Maintainer: Teddy Zhu <teddyzhu15@gmail.com>
pkgname=super-paste-bin
pkgver=1.0.0
_upstreamver=1.0.0
pkgrel=1
pkgdesc='Clipboard manager with local OCR and synchronization (upstream binaries)'
arch=('x86_64')
url='https://github.com/Teddy-Zhu/super_paste_app'
license=('MIT')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc'
         'gtk3' 'libcups' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage'
         'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss'
         'pango' 'systemd-libs' 'xdg-utils')
optdepends=('kwin: active-window detection on KDE Plasma 6 Wayland'
            'xorg-xwayland: panel positioning on Wayland'
            'xdg-desktop-portal: global shortcuts on Wayland'
            'libappindicator-gtk3: tray integration on supported desktops')
provides=("super-paste=${pkgver}")
conflicts=('super-paste' 'super_paste_app' 'super-paste-app')
options=('!strip' '!debug')
source=("super-paste-${_upstreamver}-x86_64.deb::${url}/releases/download/v${_upstreamver}/super_paste_app_${_upstreamver}_amd64.deb"
        'super-paste'
        'super-paste.desktop')
# 由 pnpm aur:prepare 根据待发布的 deb 和本地启动文件生成。
sha256sums=('7646fb2e5767d697b29d26d2e635c01675fb042e54ed4410a289dc5718d865c1'
            '8b4fd6025dfcd78aef9db07649a1978cc4399714351220962f5dc17229de8e20'
            'e7b66dbdc5e5d2cdb0920aadf2717f1d5df28c60f8e1bdf163112b8f03967f2a')

package() {
  bsdtar -xf "${srcdir}/data.tar.xz" -C "$pkgdir"
  install -Dm755 "${srcdir}/super-paste" "${pkgdir}/usr/bin/super-paste"
  install -Dm644 "${srcdir}/super-paste.desktop" \
    "${pkgdir}/usr/share/applications/com.v2dawn.sp.desktop"
  install -Dm644 "${pkgdir}/opt/SuperPaste/LICENSE.super-paste" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  chmod 4755 "${pkgdir}/opt/SuperPaste/chrome-sandbox"
}
