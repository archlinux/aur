# Maintainer: Marcus Ziade <guitaripod@gmail.com>
pkgname=flaccy-server-bin
pkgver=1.2.0
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
sha256sums_x86_64=('fb1d59cb6d63471bed56f86fec500ba2082274a7bcab9ee73be2ef1cca123b15')
sha256sums_aarch64=('a6c0d41b2adf9901e99349fa008793cb1dccc9bcf9c49383c9eb3676b3a9e40f')

package() {
  cd "$srcdir/flaccy-server-${pkgver}-linux-${CARCH}"
  install -Dm755 flaccy-server "$pkgdir/usr/bin/flaccy-server"
  sed 's|%h/.cargo/bin/flaccy-server|/usr/bin/flaccy-server|' flaccy-server.service \
    | install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/user/flaccy-server.service"
  install -Dm644 README.md "$pkgdir/usr/share/doc/flaccy-server/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
