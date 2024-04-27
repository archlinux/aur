## Maintainer: AudioLinux  audiolinux@fastmail.fm

pkgname=hqplayer-embedded
_debpkgver=5.6.0-17
_debpkgverarm=5.6.0-17
pkgver=5.6.0
pkgrel=2
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
source_aarch64=("https://www.signalyst.eu/bins/hqplayerd/bookworm/hqplayerd_"$_debpkgverarm"_arm64.deb")
sha256sums=('7a61af6b213a44003545e7dace4bd2b6cd7e7d5caa053a2d887750ab35a5a2e1'
            '5d4194a704979b3ff92482e155769460906745a66e759142eba33a2226f9cb3a')
sha256sums_x86_64=('62f8e36e83de794af9814af16c2b6f2f9149f427442ae38847d6a6a31be23f5c')
sha256sums_x86_64_v3=('62f8e36e83de794af9814af16c2b6f2f9149f427442ae38847d6a6a31be23f5c')
sha256sums_aarch64=('bd437d8a623fbce0551b0bfbe61d5fa9806def04ddfff0bb33750ae2ac7990eb')
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
