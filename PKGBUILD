# Maintainer: Marcus Ziade <guitaripod@gmail.com>
pkgname=flaccy-server-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Headless OpenSubsonic server for one music folder, made for Flaccy and any Subsonic app"
arch=('x86_64')
url="https://github.com/guitaripod/flaccy"
license=('GPL-3.0-only')
depends=('glibc')
optdepends=('ffmpeg: transcoding for apps that ask for AAC, Opus or MP3'
            'tailscale: HTTPS access from your devices with tailscale serve')
provides=('flaccy-server')
conflicts=('flaccy-server')
options=('!strip' '!debug')
source=("https://github.com/guitaripod/flaccy/releases/download/server-v${pkgver}/flaccy-server-linux-x86_64.tar.gz")
sha256sums=('11ac60b614bf7ce57375d9e37a3a85b50c97116333f99b6c7f2f45f17c6c4e41')

package() {
  cd "$srcdir/flaccy-server-linux-x86_64"
  install -Dm755 flaccy-server "$pkgdir/usr/bin/flaccy-server"
  sed 's|%h/.cargo/bin/flaccy-server|/usr/bin/flaccy-server|' flaccy-server.service \
    | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/flaccy-server.service"
  install -Dm644 README.md "$pkgdir/usr/share/doc/flaccy-server/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
