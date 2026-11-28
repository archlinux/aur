pkgname=revo-panel-bin
pkgver=0.1.4
url=https://github.com/leychan/revo-panel
license=(GPL-3.0-only)
source=(LICENSE)
sha256sums=(3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986)
source_x86_64=(revo-panel-bin-0.1.4.deb::https://github.com/leychan/revo-panel/releases/download/v0.1.4/RevoPanel_0.1.4_amd64.deb)
sha256sums_x86_64=(b10873cd2404ba06184524ed046245a9dc07bd5cc816b6c18866d5a9157b1e8b)
noextract=(revo-panel-bin-0.1.4.deb)
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
