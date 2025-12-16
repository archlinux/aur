## Maintainer: AudioLinux  audiolinux@fastmail.fm

pkgname=hqplayer-embedded
_debpkgver=5.16.1-45
_debpkgverarm=5.16.1-45
pkgver=5.16.1
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
source_aarch64=("https://www.signalyst.com/bins/hqplayerd/fc42/hqplayerd-$_debpkgverarm.fc42.aarch64.rpm")
sha256sums=('ed679026692fd90bb0c30fd66888b5062c3559a9960f86f9eea0c2ee6fdb32d5'
            'c8e1bc359cf8f2df29e9af4b8b3879779bf1ba724a07aada97ad330fffd774b0')
sha256sums_x86_64=('bff113adb3063714ccb74e6ddab48c8ea3b5927f66880cd9d82caa22f426ef15')
sha256sums_x86_64_v3=('bff113adb3063714ccb74e6ddab48c8ea3b5927f66880cd9d82caa22f426ef15')
sha256sums_x86_64_v4=('bff113adb3063714ccb74e6ddab48c8ea3b5927f66880cd9d82caa22f426ef15')
sha256sums_aarch64=('8627f3dcc1a62b89d854531aee123a88ad5fa5ff867031f9d45763050ddba726')
install=${pkgname}.install
backup=(etc/hqplayer/hqplayerd.xml)

package() {
 if [[ "$CARCH" = "x86_64" ]] || [[ "$CARCH" = "x86_64_v3" ]] || [[ "$CARCH" = "x86_64_v4" ]] ; then
 bsdtar xf data.tar.zst -C "$pkgdir"
 install -Dm644 "$pkgdir/usr/share/doc/hqplayerd/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
 rm "$pkgdir/usr/share/doc/hqplayerd/copyright"
 rm -rf "$pkgdir/lib"
 rm -rf "$pkgdir/etc/modules-load.d"
 rm -rf "$pkgdir/etc/udev"
 else
 bsdtar xf hqplayerd-$_debpkgverarm.fc42.aarch64.rpm -C "$pkgdir"
 install -Dm644 "$pkgdir/usr/share/doc/hqplayerd/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
 rm "$pkgdir/usr/share/doc/hqplayerd/LICENSE"
 fi
  
 install -Dm644 "hqplayerd_user.service" "$pkgdir/usr/lib/systemd/user/hqplayerd.service"
 install -Dm644 "hqplayerd.service" "$pkgdir/usr/lib/systemd/system/hqplayerd.service"
}
