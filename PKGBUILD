## Maintainer: AudioLinux  audiolinux@fastmail.fm

pkgname=hqplayer-embedded
_debpkgver=4.33.0-145avx2
_debpkgverarm=4.33.0-144
pkgver=4.33.0
pkgrel=1
pkgdesc="Signalyst HQPlayer Embedded
 HQPlayer - the high-end upsampling multichannel software HD-audio player"
arch=('x86_64' 'aarch64')
url="http://www.signalyst.com/custom.html"
license=('custom')
depends=('alsa-lib' 'glibc' 'libusb-compat' 'flac' 'gcc-libs' 'libgmpris' 'glib2' 'rygel' 'zip' 'unzip' 'wavpack' 'gupnp' 'openmp' 'mpg123' 'lame')
optdepends=('hqplayer-client')
conflicts=('hqplayer-embedded-amd' 'hqplayer-embedded-sse' 'hqplayer-embedded-rocm' 'hqplayer4')
provides=('hqplayer')
source=('hqplayerd.service'
        'hqplayerd_user.service'
        )
source_x86_64=("https://www.signalyst.eu/bins/hqplayerd/jammy/hqplayerd_"$_debpkgver"_amd64.deb")
source_aarch64=("https://www.signalyst.eu/bins/hqplayerd/bullseye/hqplayerd_"$_debpkgverarm"_arm64.deb")
sha256sums=('7a61af6b213a44003545e7dace4bd2b6cd7e7d5caa053a2d887750ab35a5a2e1'
            '5d4194a704979b3ff92482e155769460906745a66e759142eba33a2226f9cb3a')
sha256sums_x86_64=('7aaf1618a2dfa930968a45cbda220208bfc1ed9dafdb97bfdfbdd267418d9dd5')
sha256sums_aarch64=('72e752c036f6c6a676aa5947f1e1f54594bc4572d6fa5103d9ac35aa1cb3f356')
install=${pkgname}.install

package() {
 if [[ "$CARCH" = "x86_64" ]]; then
 bsdtar xf data.tar.zst -C "$pkgdir"
 else
 bsdtar xf data.tar.xz -C "$pkgdir"
 fi
  
  install -Dm644 "$pkgdir/usr/share/doc/hqplayerd/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 "hqplayerd_user.service" "$pkgdir/usr/lib/systemd/user/hqplayerd.service"
  install -Dm644 "hqplayerd.service" "$pkgdir/usr/lib/systemd/system/hqplayerd.service"
  
  rm -rf "$pkgdir/lib"
  rm "$pkgdir/usr/share/doc/hqplayerd/copyright"
  cp "$pkgdir"/opt/hqplayerd/lib/* "$pkgdir"/usr/lib/
  rm -rf "$pkgdir/opt"
  rm -rf "$pkgdir/etc/modules-load.d"
  rm -rf "$pkgdir/etc/udev"
}
