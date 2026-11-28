# Maintainer: Remy Huang <me@remya.top>
pkgname=remya-screen-capture-bin
_app_id=remya_screen_capture
_upstream_ver=0.4.2
pkgver=0.4.2
pkgrel=1
pkgdesc="Screen capture, recording and editing for Hyprland"
arch=('x86_64')
url="https://github.com/remyhuang03/remya-screen-capture"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=('remya-core>=0.3.0' 'gtk3' 'gtk-layer-shell' 'wayland' 'hyprland' 'grim>=1.5'
         'wl-clipboard' 'fontconfig' 'inter-font' 'gpu-screen-recorder'
         'ffmpeg' 'mpv' 'libepoxy' 'xdg-utils' 'glibc' 'gcc-libs')
options=('!strip')
provides=("remya-screen-capture=${pkgver}")
conflicts=('remya-screen-capture' 'remya-screen-capture-git')
source=("${_app_id}-${_upstream_ver}-linux-x86_64.tar.zst::${url}/releases/download/v${_upstream_ver}/${_app_id}-${_upstream_ver}-linux-x86_64.tar.zst")
sha256sums=('fb975cab40cb59241bc47378b482de72b42f8df912c147fe75551b1b214193e6')

package() {
  cd "${srcdir}/${_app_id}-${_upstream_ver}-linux-x86_64"
  install -d "${pkgdir}/usr/lib/${_app_id}" "${pkgdir}/usr/bin"
  cp -a build/linux/x64/release/bundle/. "${pkgdir}/usr/lib/${_app_id}/"
  ln -s "/usr/lib/${_app_id}/${_app_id}" "${pkgdir}/usr/bin/${_app_id}"
  install -Dm644 linux/packaging/top.remya.screen_capture.desktop \
    "${pkgdir}/usr/share/applications/top.remya.screen_capture.desktop"
  install -Dm644 linux/packaging/remya-screen-capture.json "${pkgdir}/usr/share/remya/apps/remya-screen-capture.json"
  install -Dm644 assets/icons/app_icon.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/top.remya.screen_capture.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 assets/licenses/material-symbols.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/material-symbols.txt"
  install -Dm644 lib/src/rust/capture/THIRD_PARTY_NOTICES.txt \
    "${pkgdir}/usr/share/licenses/${pkgname}/rust-dependencies.txt"
}
