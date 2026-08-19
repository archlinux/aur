# Maintainer: WooParadog <guohaochuan@gmail.com>

pkgname=toki-bin
pkgver=0.1.7
pkgrel=1
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
sha256sums_x86_64=('8a5eaf45c800fe2b8362ace9c105dd0ea57fd5f2b57b63e20942766117928c79')
sha256sums_aarch64=('8f01154beafee18b2ce99848580afae41bad28937c2238c6c2a98866b297a142')

package() {
  bsdtar -xOf "${srcdir}/${pkgname}-${pkgver}-${CARCH}.deb" data.tar.xz |
    bsdtar -xf - -C "${pkgdir}"

  install -d "${pkgdir}/usr/bin"
  ln -s /opt/Toki/toki "${pkgdir}/usr/bin/toki"
}
