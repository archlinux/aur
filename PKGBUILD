# Maintainer: Audiolinux  audiolinux@fastmail.fm

pkgname=tune-server
pkgver=1.0.0.rc11
_pkgver=1.0.0
rc=11
pkgrel=1
pkgdesc="self-hosted multi-room music server in Rust: local library (FLAC/DSD) + Qobuz/Tidal/Deezer to DLNA/UPnP, Chromecast, AirPlay"
arch=('x86_64' 'aarch64')
url="https://mozaiklabs.fr/"
license=('custom')
depends=('libstdc++' 'python'  'alsa-lib' 'ffmpeg' 'portaudio' 'avahi')
optdepends=('avahi')
source=('tune-server.conf' 'copyright' 'tune-server.service' 'sysusers.d' 'tmpfiles.d')
source_x86_64=("https://github.com/renesenses/tune-server-rust/releases/download/v$_pkgver-rc"$rc"/tune-server-linux-x86_64.tar.gz")
source_aarch64=("https://github.com/renesenses/tune-server-rust/releases/download/v$_pkgver-rc"$rc"/tune-server-linux-aarch64.tar.gz")
sha256sums=('f92ca919fe6465e8f2141625c34657e3b4e3cba412c34714d232d11ec3d987a0' '3f27ad7c1afcdfa518a936a4817a4cfaaac9fbdc055f09b1e06772858188d2b6' '57cc779089fdd19aae126c1bf6d3257af48d34c4bf6f4f16ae0f77a532f61a60' 'ea2a97dca78b25341876c1d62b66a9561a7fd40197137b0e104c565b25d59cf4' '6e7a92685d8020446dd929c6da56a69f5d2e82d40d90cf82c43607b559943396')
sha256sums_x86_64=('903675fe4701badd7b5e9ec8a203e3b917e6779390e5e3704f67f529c9f86eb6')
sha256sums_aarch64=('98ee99580c1d1f2997ebd5892a84f727bf58c0fb97da42982255aeffaaf4f30e')
install=$pkgname.install
backup=(etc/default/tune-server)

package() {
install -d $pkgdir/opt/tune
cp -R $srcdir/* $pkgdir/opt/tune; find $pkgdir/opt/tune -type l -exec rm -f {} \;
install -Dm644  tune-server.conf $pkgdir/etc/default/tune-server
install -Dm644  tune-server.service $pkgdir/usr/lib/systemd/system/tune-server.service 
install -Dm644 tmpfiles.d $pkgdir/usr/lib/tmpfiles.d/tune-server.conf
install -Dm644 sysusers.d $pkgdir/usr/lib/sysusers.d/tune-server.conf
install -Dm644 copyright $pkgdir/usr/share/licenses/tune-server/copyright
}
