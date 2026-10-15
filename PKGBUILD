## Maintainer: AudioLinux  audiolinux@fastmail.fm

pkgname=hqplayer-embedded-sse
_debpkgname=hqplayer-embedded
_debpkgver=6.1.1-5
pkgver=6.1.1
pkgrel=1
pkgdesc="Signalyst HQPlayer Embedded
 HQPlayer - the high-end upsampling multichannel software HD-audio player"
arch=('x86_64')
url="http://www.signalyst.com/custom.html"
license=('custom')
depends=('alsa-lib' 'glibc' 'libusb-compat' 'flac' 'gcc-libs' 'zip' 'unzip' 'wavpack' 'openmp' 'mpg123' 'lame' 'libmicrohttpd' 'cairo')
optdepends=('hqplayer-client')
conflicts=('hqplayer-embedded')
source=("https://www.signalyst.com/bins/hqplayerd/resolute/hqplayerd_"$_debpkgver"intel_amd64.deb"
        'hqplayerd.service'
        'hqplayerd_user.service'
        )
sha256sums=('bc5ff9f601245db0f89a13b8a28d6abd6416f03c17ad88f38f1eb657b01a8e02'
            '15b8150b86441b92ac0192f21fe80ca220b74af97c1b423125c1cbf60b23f069'
            'e40b296cea92dcbb68660f80796b9b41ef55230cfb0755724cd2ca484ab24fd7')
install=${pkgname}.install
backup=(etc/hqplayer/hqplayerd.xml)

package() {
 bsdtar xf data.tar.zst -C "$pkgdir"
 
  install -Dm644 "$pkgdir/usr/share/doc/hqplayerd/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 "hqplayerd_user.service" "$pkgdir/usr/lib/systemd/user/hqplayerd.service"
  install -Dm644 "hqplayerd.service" "$pkgdir/usr/lib/systemd/system/hqplayerd.service"
  
  rm -rf "$pkgdir/lib"
  rm "$pkgdir/usr/share/doc/hqplayerd/copyright"
  rm -rf "$pkgdir/etc/modules-load.d"
  rm -rf "$pkgdir/etc/udev"
}
