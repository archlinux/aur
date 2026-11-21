# Maintainer: Marcus Ziade <marcus@midgarcorp.cc>
pkgname=flaccy-server-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="Headless OpenSubsonic server for one music folder, made for Flaccy and any Subsonic app"
arch=('x86_64' 'aarch64')
url="https://github.com/guitaripod/flaccy"
license=('GPL-3.0-only')
optdepends=('ffmpeg: transcoding for apps that ask for AAC, Opus or MP3'
            'tailscale: HTTPS access from your devices with tailscale serve')
provides=('flaccy-server')
conflicts=('flaccy-server')
options=('!strip' '!debug')
source_x86_64=("https://github.com/guitaripod/flaccy/releases/download/server-v${pkgver}/flaccy-server-${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/guitaripod/flaccy/releases/download/server-v${pkgver}/flaccy-server-${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('339ab594c250385719a598f6f80d6435a4c5b4a4a912233f04a54f790b9b6fef')
sha256sums_aarch64=('1341f3ad18a2f671a7561dc91d30141edd7579a5f21300019519860398e9739c')

package() {
  cd "$srcdir/flaccy-server-${pkgver}-linux-${CARCH}"
  install -Dm755 flaccy-server "$pkgdir/usr/bin/flaccy-server"
  sed 's|%h/.cargo/bin/flaccy-server|/usr/bin/flaccy-server|' flaccy-server.service \
    | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/flaccy-server.service"
  install -Dm644 README.md "$pkgdir/usr/share/doc/flaccy-server/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
