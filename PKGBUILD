pkgname=revo-panel-bin
pkgver=0.1.3
url=https://github.com/leychan/revo-panel
license=(GPL-3.0-only)
source=(LICENSE)
sha256sums=(3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986)
source_x86_64=(revo-panel-bin-0.1.3.deb::https://github.com/leychan/revo-panel/releases/download/v0.1.3/RevoPanel_0.1.3_amd64.deb)
sha256sums_x86_64=(9c084d68051461d0d987216ae68f28358ca013175ac781da2bf49338262b68dc)
noextract=(revo-panel-bin-0.1.3.deb)
pkgrel=1
pkgdesc='Linux hardware control panel for MECHREVO laptops'
arch=('x86_64')
depends=('cairo' 'dbus' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgcc'
         'libayatana-appindicator' 'libsoup3' 'webkit2gtk-4.1')
optdepends=('bluez: external water cooler'
            'libkscreen: KDE display brightness and refresh rate'
            'nvidia-utils: NVIDIA GPU metrics'
            'polkit: authorization for HID lighting controls'
            'power-profiles-daemon: system power profiles')
provides=('revo-panel')
conflicts=('revo-panel')
options=('!strip')

package() {
  # 只提取成品中的程序、桌面入口和图标。
  bsdtar -xOf "${srcdir}/${noextract[0]}" data.tar.gz |
    bsdtar --no-same-owner -xf - -C "${pkgdir}" usr || return
  if [[ -f "${srcdir}/LICENSE" ]]; then
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
