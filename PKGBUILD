# Maintainer: dax
#
# Generated from anomalyco/hokum packaging/aur by scripts/release-aur.sh,
# which sets pkgver, the release service's linux-x64 and linux-arm64 file
# URLs, and the checksums for each release.
#
# Like dunst and xfce4-notifyd it provides notification-daemon. Like mako,
# dunst, and swaync it installs its D-Bus activation file under its own name,
# so it shares no file with them and conflicts with none: whichever daemon
# runs first owns org.freedesktop.Notifications, and hokum.service stops
# mako, dunst, and swaync when it starts.
pkgname=hokum-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='Hokum: a freedesktop notification daemon for Wayland layer-shell compositors'
arch=('x86_64' 'aarch64')
url='https://hokum.app'
license=('MIT')
provides=('hokum' 'notification-daemon')
conflicts=('hokum')
# Linked: glibc, libgcc, xkbcommon. Loaded at run time (so namcap calls them
# unneeded): the Vulkan loader and a driver, and the Wayland client library.
depends=('glibc' 'libgcc' 'libxkbcommon' 'vulkan-driver' 'vulkan-icd-loader' 'wayland')
options=('!strip' '!debug')
install=hokum-bin.install
source=(
  'hokum.service'
  'app.hokum.Notifications.service'
  'hokum.desktop'
  'LICENSE'
)
source_x86_64=("hokum-${pkgver}-linux-x64::https://anoma.ly/release/hokum/files/e00c8c6ebd0cfb7c53d535d6fab7ec02c2f42bb24c4057c178f8201253276d45/hokum")
source_aarch64=("hokum-${pkgver}-linux-arm64::https://anoma.ly/release/hokum/files/e18e7e0fc812ba7efdfa97580b25c7a483e5982e92b3321ad6d3ec5a7408e695/hokum")
sha256sums=('b727bc7906ea476f2555b143a550af48227addbdac807d562b946510c1efb20b'
            'e83761aacd0d5ec5207e594564fdaa5677def9928ba07fcadb51f1c042c62034'
            'a2f5db48078f9d8109c6d53502313ff9639643ea07a7a968e99d9c4802198335'
            'b1fe69afe2f6fe0884efc8936dab69bbdf3a319b3828a965ee1304fbd6a60021')
sha256sums_x86_64=('e00c8c6ebd0cfb7c53d535d6fab7ec02c2f42bb24c4057c178f8201253276d45')
sha256sums_aarch64=('e18e7e0fc812ba7efdfa97580b25c7a483e5982e92b3321ad6d3ec5a7408e695')

package() {
  local target=x64
  [ "$CARCH" = aarch64 ] && target=arm64
  install -Dm755 "hokum-${pkgver}-linux-${target}" "$pkgdir/usr/bin/hokum"
  install -Dm644 hokum.service "$pkgdir/usr/lib/systemd/user/hokum.service"
  install -Dm644 app.hokum.Notifications.service \
    "$pkgdir/usr/share/dbus-1/services/app.hokum.Notifications.service"
  install -Dm644 hokum.desktop "$pkgdir/usr/share/applications/hokum.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
