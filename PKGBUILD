# Maintainer: Marcus Ziade <marcus@midgarcorp.cc>
pkgname=flaccy-server-bin
pkgver=1.3.0
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
sha256sums_x86_64=('dfc376450aed53ebf8c072a2439f2324948f139132a0a11989bf45ce3d83c741')
sha256sums_aarch64=('d34cff69478cf3e2f47e9b95ea80ff75e2cc5e516c1188fad850bb911a216e00')

package() {
  cd "$srcdir/flaccy-server-${pkgver}-linux-${CARCH}"
  install -Dm755 flaccy-server "$pkgdir/usr/bin/flaccy-server"
  sed 's|%h/.cargo/bin/flaccy-server|/usr/bin/flaccy-server|' flaccy-server.service \
    | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/flaccy-server.service"
  install -Dm644 README.md "$pkgdir/usr/share/doc/flaccy-server/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
