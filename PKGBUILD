# Maintainer: Audiolinux  audiolinux@fastmail.fm

pkgname=tune-server
pkgver=1.0.0.rc3
_pkgver=1.0.0
rc=3
pkgrel=1
pkgdesc="self-hosted multi-room music server in Rust: local library (FLAC/DSD) + Qobuz/Tidal/Deezer to DLNA/UPnP, Chromecast, AirPlay"
arch=('x86_64' 'aarch64')
url="https://mozaiklabs.fr/"
license=('custom')
depends=('libstdc++' 'alsa-lib')
source=('tune-server.service' 'sysusers.d' 'tmpfiles.d')
source_x86_64=("https://github.com/renesenses/tune-server-rust/releases/download/v$_pkgver-rc"$rc"/tune-server_$_pkgver-rc"$rc"_amd64.deb")
source_aarch64=("https://github.com/renesenses/tune-server-rust/releases/download/v$_pkgver-rc"$rc"/tune-server_$_pkgver-rc"$rc"_arm64.deb")
sha256sums=('57cc779089fdd19aae126c1bf6d3257af48d34c4bf6f4f16ae0f77a532f61a60' 'ea2a97dca78b25341876c1d62b66a9561a7fd40197137b0e104c565b25d59cf4' '6e7a92685d8020446dd929c6da56a69f5d2e82d40d90cf82c43607b559943396')
sha256sums_x86_64=('7d7ca6e9deccecf19bb48e51a8153f0975dbaac0ca368767bbc25b96c4f85693')
sha256sums_aarch64=('8e699bd7066618b72b6d7e1b47d1706fc76dd51806d170ee1359e8b0e7c76475')
install=$pkgname.install
backup=(etc/default/hqplayer/tune-core)

package() {
cd "$srcdir"
bsdtar xf data.tar.zst -C "$pkgdir"
install -Dm644  $pkgdir/lib/systemd/system/tune-server.service $pkgdir/usr/lib/systemd/system/tune-server.service 
rm -rf $pkgdir/lib
install -Dm644 tmpfiles.d $pkgdir/usr/lib/tmpfiles.d/tune-server.conf
install -Dm644 sysusers.d $pkgdir/usr/lib/sysusers.d/tune-server.conf
}
