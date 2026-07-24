# Maintainer: Murdi <murdialthaf848@gmail.com>

pkgname=animaru
pkgver=0.2.0
pkgrel=1
pkgdesc="A GTK4 GUI for watching and downloading anime"
arch=('any')
url="https://github.com/murdialthaf/animaru"
license=('GPL3')
depends=(
  'python'
  'python-gobject'
  'python-pipx'
  'gtk4'
  'libadwaita'
  'mpv'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/murdialthaf/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 /dev/stdin "${pkgdir}/usr/bin/animaru" << 'WRAPPER'
#!/bin/bash
APP=animaru
PIPX_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/pipx"
export PIPX_HOME
if ! "$PIPX_HOME/venvs/$APP/bin/$APP" --version &>/dev/null; then
  pipx install "git+https://github.com/murdialthaf/animaru.git"
fi
exec "$PIPX_HOME/venvs/$APP/bin/$APP" "$@"
WRAPPER

  install -Dm644 data/animaru.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 data/icons/animaru.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
}
