# Maintainer: Jai-JAP <jai dot jap dot 318 at gmail dot com>
pkgname=keymapper-bin
pkgver=4.11.0
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
sha256sums_x86_64=('d7e7fb06f83de10bfddd1f8f3bdacda8719a32d4fb3a7fdcc875099d5aa49c2b')

source_aarch64=(${pkgname%-bin}-arm64.tgz::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-Linux-arm64.tar.gz)
sha256sums_aarch64=('0bd6d60b97dafffcb157fe6f673dc20e9f1052484da3f1e5768566ec06cf6114')

_arch=${CARCH/aarch64/arm64}

prepare() {
  # Taken from keymapper aur script <https://aur.archlinux.org/packages/keymapper>
  sed -i 's|^ExecStart=keymapperd|ExecStart=/usr/bin/keymapperd|' \
    ${pkgname%-bin}-${pkgver}-Linux-${_arch}/usr/lib/systemd/system/keymapperd.service
}

package() {
  for dir in usr etc; do
    cp -r ${pkgname%-bin}-${pkgver}-Linux-${_arch}/${dir} ${pkgdir}/
  done
}
