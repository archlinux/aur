## Maintainer: AudioLinux  audiolinux@fastmail.fm

pkgname=hqplayer-embedded
_debpkgver=5.13.1-38
_debpkgverarm=5.13.1-38
pkgver=5.13.1
pkgrel=1
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
source_x86_64=("https://www.signalyst.com/bins/hqplayerd/noble/hqplayerd_"$_debpkgver"_amd64.deb")
source_x86_64_v3=("https://www.signalyst.com/bins/hqplayerd/noble/hqplayerd_"$_debpkgver"_amd64.deb")
source_x86_64_v4=("https://www.signalyst.com/bins/hqplayerd/noble/hqplayerd_"$_debpkgver"_amd64.deb")
source_aarch64=("https://www.signalyst.com/bins/hqplayerd/bookworm/hqplayerd_"$_debpkgverarm"_arm64.deb")
sha256sums=('ed679026692fd90bb0c30fd66888b5062c3559a9960f86f9eea0c2ee6fdb32d5'
            'c8e1bc359cf8f2df29e9af4b8b3879779bf1ba724a07aada97ad330fffd774b0')
sha256sums_x86_64=('d09031ed8fbe0cef8a2baf861003eb26d2076ad0193f91a4d39f2eb5f1a0c86f')
sha256sums_x86_64_v3=('d09031ed8fbe0cef8a2baf861003eb26d2076ad0193f91a4d39f2eb5f1a0c86f')
sha256sums_x86_64_v4=('d09031ed8fbe0cef8a2baf861003eb26d2076ad0193f91a4d39f2eb5f1a0c86f')
sha256sums_aarch64=('bbd4edcf11aa4187bf5338de36799877d8a1392e101ba2e7ac6224c8c223a78f')
install=${pkgname}.install
backup=(etc/hqplayer/hqplayerd.xml)

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
