# Maintainer: Daniel Azevedo <daniazevedo77@posteo.net>

pkgname=wasp-d77
_name=wasp
pkgver=0.9.1
pkgrel=1
pkgdesc="Lua-configurable Wayland compositor based on dwl/wlroots"
arch=('x86_64' 'aarch64')
url="https://github.com/dani-77/wasp"
license=('GPL-3.0-or-later' 'MIT')
# The "wasp" AUR package is an unrelated MQTT broker that also ships
# /usr/bin/wasp.
provides=('wasp')
conflicts=('wasp')
depends=('wlroots0.20' 'scenefx0.5' 'wayland' 'libxkbcommon' 'libinput'
         'pixman' 'fcft' 'lua54' 'libxcb' 'xcb-util-wm' 'xorg-xwayland'
         'dbus' 'glibc')
makedepends=('wayland-protocols' 'tllist' 'pkgconf')
optdepends=(
  'iw: wifi status in wasp-statusbar'
  'libpulse: volume in wasp-statusbar (pactl)'
  'xdg-desktop-portal-gtk: default portal backend (file dialogs, etc.)'
  'xdg-desktop-portal-wlr: screen sharing and screenshots through portals'
)
backup=('etc/xdg-desktop-portal/wasp-portals.conf')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6d12700903a4d59a494984882126c7bda15ede8788a071c0f98d050a2e10d762')

build() {
    cd "$_name-$pkgver"
    # config.mk derives VERSION from `git describe`, which a release
    # tarball can't answer.
    make VERSION="$pkgver"
}

package() {
    cd "$_name-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" VERSION="$pkgver" install
    install -Dm644 LICENSE.wasp "$pkgdir/usr/share/licenses/$pkgname/LICENSE.wasp"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
