## Maintainer: AudioLinux  audiolinux@fastmail.fm

pkgname=hqplayer-embedded
_debpkgver=5.2.0-6avx2
_debpkgverarm=5.2.0-6
pkgver=5.2.0
pkgrel=1
pkgdesc="Signalyst HQPlayer Embedded
 HQPlayer - the high-end upsampling multichannel software HD-audio player"
arch=('x86_64' 'x86_64_v3' 'aarch64')
url="http://www.signalyst.com/custom.html"
license=('custom')
depends=('alsa-lib' 'glibc' 'libusb-compat' 'flac' 'gcc-libs' 'libgmpris' 'glib2' 'rygel' 'zip' 'unzip' 'wavpack' 'gupnp' 'gupnp-av' 'openmp' 'mpg123' 'lame')
optdepends=('hqplayer-client')
source=('hqplayerd.service'
        'hqplayerd_user.service'
        )
source_x86_64=("https://www.signalyst.eu/bins/hqplayerd/jammy/hqplayerd_"$_debpkgver"_amd64.deb")
source_x86_64_v3=("https://www.signalyst.eu/bins/hqplayerd/jammy/hqplayerd_"$_debpkgver"_amd64.deb")
source_aarch64=("https://www.signalyst.eu/bins/hqplayerd/bullseye/hqplayerd_"$_debpkgverarm"_arm64.deb")
sha256sums=('7a61af6b213a44003545e7dace4bd2b6cd7e7d5caa053a2d887750ab35a5a2e1'
            '5d4194a704979b3ff92482e155769460906745a66e759142eba33a2226f9cb3a')
sha256sums_x86_64=('d1a1611957bc44ec50cc3c9dc5e5cffb6d8a66e74f5533055bb5ca017b1b95df')
sha256sums_x86_64_v3=('d1a1611957bc44ec50cc3c9dc5e5cffb6d8a66e74f5533055bb5ca017b1b95df')
sha256sums_aarch64=('7f0db04d90bd617876d471727f72f7b814b26199a845313fa658213b5e1e1e50')
install=${pkgname}.install

package() {
 if [[ "$CARCH" = "x86_64" ]] || [[ "$CARCH" = "x86_64_v3" ]]; then
 bsdtar xf data.tar.zst -C "$pkgdir"
 else
 bsdtar xf data.tar.xz -C "$pkgdir"
 fi
  
  install -Dm644 "$pkgdir/usr/share/doc/hqplayerd/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 "hqplayerd_user.service" "$pkgdir/usr/lib/systemd/user/hqplayerd.service"
  install -Dm644 "hqplayerd.service" "$pkgdir/usr/lib/systemd/system/hqplayerd.service"
  
  rm -rf "$pkgdir/lib"
  rm "$pkgdir/usr/share/doc/hqplayerd/copyright"
  rm -rf "$pkgdir/etc/modules-load.d"
  rm -rf "$pkgdir/etc/udev"
}
