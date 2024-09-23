## Maintainer: AudioLinux  audiolinux@fastmail.fm

pkgname=hqplayer-embedded
_debpkgver=5.7.1-22
_debpkgverarm=5.7.1-22
pkgver=5.7.1
pkgrel=2
pkgdesc="Signalyst HQPlayer Embedded
 HQPlayer - the high-end upsampling multichannel software HD-audio player"
arch=('x86_64' 'x86_64_v3' 'x86_64_v4' 'aarch64')
url="http://www.signalyst.com/custom.html"
license=('custom')
depends=('alsa-lib' 'glibc' 'libusb-compat' 'flac' 'gcc-libs' 'libgmpris' 'glib2' 'rygel' 'zip' 'unzip' 'wavpack' 'gupnp' 'gupnp-av' 'openmp' 'mpg123' 'lame' 'libsoup3')
optdepends=('hqplayer-client')
source=('hqplayerd.service'
        'hqplayerd_user.service'
        )
source_x86_64=("https://www.signalyst.eu/bins/hqplayerd/noble/hqplayerd_"$_debpkgver"_amd64.deb")
source_x86_64_v3=("https://www.signalyst.eu/bins/hqplayerd/noble/hqplayerd_"$_debpkgver"_amd64.deb")
source_x86_64_v4=("https://www.signalyst.eu/bins/hqplayerd/noble/hqplayerd_"$_debpkgver"_amd64.deb")
source_aarch64=("https://www.signalyst.eu/bins/hqplayerd/bookworm/hqplayerd_"$_debpkgverarm"_arm64.deb")
sha256sums=('7a61af6b213a44003545e7dace4bd2b6cd7e7d5caa053a2d887750ab35a5a2e1'
            '5d4194a704979b3ff92482e155769460906745a66e759142eba33a2226f9cb3a')
sha256sums_x86_64=('9f1f3a4417f90f6296f6eb3ce71a8a1a3d0151610d4bc4e93bd3a5f043915e10')
sha256sums_x86_64_v3=('9f1f3a4417f90f6296f6eb3ce71a8a1a3d0151610d4bc4e93bd3a5f043915e10')
sha256sums_x86_64_v4=('9f1f3a4417f90f6296f6eb3ce71a8a1a3d0151610d4bc4e93bd3a5f043915e10')
sha256sums_aarch64=('079979c00da50642cb8f3999aafea7010de5c9e8b00a5a8c69d26842f7e972d8')
install=${pkgname}.install

package() {
 if [[ "$CARCH" = "x86_64" ]] || [[ "$CARCH" = "x86_64_v3" ]] || [[ "$CARCH" = "x86_64_v4" ]] ; then
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
