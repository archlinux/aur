# Maintainer: instantOS <hello@instantos.io>
pkgname=instantwm-bin
_pkgname=instantwm
pkgver=0.8.2
pkgrel=1
pkgdesc="A tiling window manager for X11 and Wayland (prebuilt binary)"
arch=('x86_64')
url="https://instantos.io"
license=('MIT')
# Match the source package's epoch for versioned dependencies.
provides=("$_pkgname=1:$pkgver")
conflicts=('instantwm')
depends=(
    'bash'
    'gcc-libs'
    'glibc'
    'libx11'
    'libxcb'
    'libxkbcommon'
    'libxcursor'
    'libxinerama'
    'libxrandr'
    'libxss'
    'libxtst'
    'libxfixes'
    'libxdamage'
    'libxcomposite'
    'libxrender'
    'libxft'
    'libxi'
    'libxres'
    'libxvmc'
    'libxxf86vm'
    'libxt'
    'libxmu'
    'libxpm'
    'libxaw'
    'fontconfig'
    'freetype2'
    'libdrm'
    'mesa'
    'wayland'
    'libinput'
    'seatd'
    'libglvnd'
    'libevdev'
    'libwacom'
    'dbus'
    'systemd'
    'xorg-setxkbmap'
    'xdg-desktop-portal-wlr'
)
optdepends=('instantmenu: global shortcut approval and configuration dialogs' 'xdg-desktop-portal: application global shortcuts')
source=(
    "$_pkgname-$pkgver.tar.gz::https://github.com/instantOS/instantWM/archive/refs/tags/v$pkgver.tar.gz"
    "https://github.com/instantOS/instantWM/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu-v$pkgver.tgz"
)
sha256sums=(
    '2bc38fa3ccb943db2656c748184e14d5fad30774771fd0d2e5f4137e4b4fc879'
    '193bd58e96a8c448ab2082777947b149b8985e1919cdf0f4acf5cddf87608669'
)

package() {
    cd "instantWM-$pkgver"

    install -Dm755 "$srcdir/$_pkgname-x86_64-unknown-linux-gnu-v$pkgver/instantwm" "$pkgdir/usr/bin/instantwm"
    install -Dm755 "$srcdir/$_pkgname-x86_64-unknown-linux-gnu-v$pkgver/instantwmctl" "$pkgdir/usr/bin/instantwmctl"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 scripts/startinstantos "$pkgdir/usr/bin/startinstantos"
    install -Dm644 utils/instantwm-x11.desktop "$pkgdir/usr/share/xsessions/instantwm.desktop"
    install -Dm644 utils/instantwm-wayland.desktop "$pkgdir/usr/share/wayland-sessions/instantwm-wayland.desktop"

    install -Dm644 utils/instantwm-wayland-debug.desktop "$pkgdir/usr/share/wayland-sessions/instantwm-debug.desktop"
    install -Dm755 scripts/instantwm-debug.sh "$pkgdir/usr/bin/instantwm-debug"

    install -Dm644 resources/instantwm-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/instantwm-portals.conf"
    install -Dm644 resources/instantwm.portal "$pkgdir/usr/share/xdg-desktop-portal/portals/instantwm.portal"
    install -Dm644 resources/instantwm-session.target "$pkgdir/usr/lib/systemd/user/instantwm-session.target"
}
