## Maintainer: AudioLinux  audiolinux@fastmail.fm

pkgname=hqplayer-embedded
_debpkgver=6.0.1-2
_debpkgverarm=6.0.1-2
pkgver=6.0.1
pkgrel=1
pkgdesc="Signalyst HQPlayer Embedded
 HQPlayer - the high-end upsampling multichannel software HD-audio player"
arch=('x86_64' 'aarch64')
url="http://www.signalyst.com/custom.html"
license=('custom')
depends=('alsa-lib' 'glibc' 'libusb-compat' 'flac' 'gcc-libs' 'zip' 'unzip' 'wavpack' 'openmp' 'mpg123' 'lame' 'libmicrohttpd')
optdepends=('hqplayer-client')
source=('hqplayerd.service'
        'hqplayerd_user.service'
        )
source_x86_64=("https://www.signalyst.com/bins/hqplayerd/noble/hqplayerd_"$_debpkgver"_amd64.deb")
source_aarch64=("https://www.signalyst.com/bins/hqplayerd/fc43/hqplayerd-$_debpkgverarm.fc43.aarch64.rpm")
sha256sums=('15b8150b86441b92ac0192f21fe80ca220b74af97c1b423125c1cbf60b23f069'
            'e40b296cea92dcbb68660f80796b9b41ef55230cfb0755724cd2ca484ab24fd7')
sha256sums_x86_64=('649b111858becfe47beaf60b32d3c70170ea34f7df1d8bcb29e5666a8b8e5123')
sha256sums_aarch64=('b21432d3b07c53312563a76454a587dff5a8471f988505469a77a66812caab86')
install=${pkgname}.install
backup=(etc/hqplayer/hqplayerd.xml)

package() {
 if [[ "$CARCH" = "x86_64" ]]; then
 bsdtar xf data.tar.zst -C "$pkgdir"
 install -Dm644 "$pkgdir/usr/share/doc/hqplayerd/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
 rm "$pkgdir/usr/share/doc/hqplayerd/copyright"
 rm -rf "$pkgdir/lib"
 rm -rf "$pkgdir/etc/modules-load.d"
 rm -rf "$pkgdir/etc/udev"
 else
 bsdtar xf hqplayerd-$_debpkgverarm.fc43.aarch64.rpm -C "$pkgdir"
 install -Dm644 "$pkgdir/usr/share/doc/hqplayerd/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
 rm "$pkgdir/usr/share/doc/hqplayerd/LICENSE"
 fi
  
 install -Dm644 "hqplayerd_user.service" "$pkgdir/usr/lib/systemd/user/hqplayerd.service"
 install -Dm644 "hqplayerd.service" "$pkgdir/usr/lib/systemd/system/hqplayerd.service"
}
