# Maintainer: Jai-JAP <jai dot jap dot 318 at gmail dot com>
pkgname=keymapper-bin
pkgver=4.10.0
pkgrel=1
pkgdesc="A cross-platform context-aware keyremapper"
arch=(x86_64)
url=https://github.com/houmain/keymapper
conflicts=(keymapper)
provides=(keymapper)
license=("GPL-3.0-or-later")
depends=(dbus gcc-libs libappindicator-gtk3 libusb libx11 libxkbcommon wayland)

source=(autostart.desktop)
sha256sums=('b3312492e497b5976501a42445b70309183811da545257742f7b99364cdca402')

source_x86_64=(${pkgname%-bin}-amd64.tgz::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-Linux.tar.gz)
sha256sums_x86_64=('860713472154a7de6fed75a4f8c8d59d0cfffaf3c3b47ae9bc565169b1795074')

prepare() {
  # Taken from keymapper aur script <https://aur.archlinux.org/packages/keymapper>
  sed -i 's|^ExecStart=keymapperd|ExecStart=/usr/bin/keymapperd|' \
    ${pkgname%-bin}-${pkgver}-Linux/lib/systemd/system/keymapperd.service
}

package() {
  mkdir -p ${pkgdir}/usr 
  install -Dm644 ${srcdir}/autostart.desktop ${pkgdir}/etc/xdg/autostart/${pkgname%-bin}.desktop
  for dir in bin lib share; do
    cp -r ${pkgname%-bin}-${pkgver}-Linux/${dir} ${pkgdir}/usr/
  done
}
