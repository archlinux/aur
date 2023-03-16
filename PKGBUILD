# Maintainer: Noah Vogt (noahvogt) <noah@noahvogt.com>
# Maintainer: Bruno Pagani <archange@archlinux.org>

# Remember to handle https://bugs.archlinux.org/task/74324 on major upgrades
_use_suffix=0
pkgver=22.3.2
pkgrel=1

_major_ver=${pkgver%%.*}
if [[ ${_use_suffix} != 0 ]]; then
  pkgname="electron${_major_ver}-xdg-bin"
else
  pkgname=electron-xdg-bin
fi
pkgdesc='Build cross platform desktop apps with web technologies - without creating a useless ~/.pki directory (binary version)'
arch=('x86_64')
url='https://electronjs.org/'
license=('MIT' 'custom')
depends=('c-ares' 'ffmpeg' 'gtk3' 'libevent' 'libxslt' 'minizip' 'nss' 're2'
         'snappy')
optdepends=('kde-cli-tools: file deletion support (kioclient5)'
            'libappindicator-gtk3: StatusNotifierItem support'
            'pipewire: WebRTC desktop sharing under Wayland'
            'trash-cli: file deletion support (trash-put)'
            'xdg-utils: open URLs with desktop’s default (xdg-email, xdg-open)')
if [[ ${_use_suffix} == 0 ]]; then
  conflicts=("electron${_major_ver}" "electron")
  provides=("electron${_major_ver}" "electron")
else
  provides=("electron")
  conflicts=("electron")
fi
source=("https://github.com/noahvogt/${pkgname%-*}/releases/download/$pkgver-$pkgrel/${pkgname%-*}-$pkgver-$pkgrel-x86_64.pkg.tar.zst")
sha256sums=('43b96a1e25854c84ad28361b6a863057c26e8ba9715817be3daffbb177ffd9ac')

package() {
  cp -R "${srcdir}/usr/" "${pkgdir}/usr"
  chown root "${pkgdir}/usr/lib/${pkgname%%-*}/chrome-sandbox"
  chmod 4755 "${pkgdir}/usr/lib/${pkgname%%-*}/chrome-sandbox"
}
