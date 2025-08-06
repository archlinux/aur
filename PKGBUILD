# Maintainer: Jai-JAP <jai dot jap dot 318 at gmail dot com>
pkgname=keymapper-bin
pkgver=4.12.3
pkgrel=1
pkgdesc="A cross-platform context-aware keyremapper"
arch=(x86_64 aarch64)
url=https://github.com/houmain/keymapper
conflicts=(keymapper)
provides=(keymapper)
license=("GPL-3.0-or-later")
depends=(dbus gcc-libs libayatana-appindicator libappindicator-gtk3 libusb libx11 libxkbcommon wayland)

source=(autostart.desktop)
sha256sums=('b3312492e497b5976501a42445b70309183811da545257742f7b99364cdca402')

source_x86_64=(${pkgname%-bin}-amd64.tgz::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-Linux-x86_64.tar.gz)
sha256sums_x86_64=('ac060ee5dedb83b6203f0c8574e67aa1f2a7797cf19a22ce364208e273a5613c')

source_aarch64=(${pkgname%-bin}-arm64.tgz::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-Linux-arm64.tar.gz)
sha256sums_aarch64=('69ae1a9eaf6b42c108e9fde7afa87f9b6c7dd718d993ab42f6e11b121ae516e7')

_arch=${CARCH/aarch64/arm64}

prepare() {
  # Taken from keymapper aur script <https://aur.archlinux.org/packages/keymapper>
  sed -i 's|^ExecStart=keymapperd|ExecStart=/usr/bin/keymapperd|' \
    "${pkgname%-bin}-${pkgver}-Linux-${_arch}/usr/lib/systemd/system/keymapperd.service"
}

package() {
  for dir in usr etc; do
    cp -r "${pkgname%-bin}-${pkgver}-Linux-${_arch}/${dir}" "${pkgdir}/"
  done
}
