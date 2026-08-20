# Maintainer: WooParadog <guohaochuan@gmail.com>

pkgname=toki-bin
pkgver=0.1.7
pkgrel=2
pkgdesc='AI scheduling agent desktop application'
arch=('x86_64' 'aarch64')
url='https://toki.com/'
license=('unknown')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'glib2'
  'glibc'
  'gtk3'
  'libcups'
  'libdrm'
  'libgcc'
  'libnotify'
  'libsecret'
  'libx11'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=('libappindicator: system tray support')
provides=("toki=${pkgver}")
conflicts=('toki')
options=('!strip')

source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://downloads.toki.com/desktop/toki_${pkgver}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::https://downloads.toki.com/desktop/toki_${pkgver}_arm64.deb")
noextract=(
  "${pkgname}-${pkgver}-x86_64.deb"
  "${pkgname}-${pkgver}-aarch64.deb"
)
sha256sums_x86_64=('2f7110bf47abbc90f844c318aae5e63cfd8acda478fc4057a97df8a8bcaf0b10')
sha256sums_aarch64=('e5a1a63e39f7f86458d5fa6660675c3b6a3ef49b633bd1a94ad79b3606f58a73')

package() {
  bsdtar -xOf "${srcdir}/${pkgname}-${pkgver}-${CARCH}.deb" data.tar.xz |
    bsdtar -xf - -C "${pkgdir}"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/Toki/toki "${pkgdir}/usr/bin/toki"
}
