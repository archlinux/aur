## Maintainer: AudioLinux  audiolinux@fastmail.fm

pkgname=hqplayer-embedded-sse
_debpkgname=hqplayer-embedded
_debpkgver=5.9.3-28intel
pkgver=5.9.3
pkgrel=1
pkgdesc="Signalyst HQPlayer Embedded
 HQPlayer - the high-end upsampling multichannel software HD-audio player"
arch=('x86_64' 'x86_64_v3' 'x86_64_v4' 'aarch64')
url="http://www.signalyst.com/custom.html"
license=('custom')
depends=('alsa-lib' 'glibc' 'libusb-compat' 'flac' 'gcc-libs' 'libgmpris' 'glib2' 'rygel' 'zip' 'unzip' 'wavpack' 'gupnp' 'openmp' 'mpg123' 'lame' 'libsoup3')
optdepends=('hqplayer-client')
conflicts=('hqplayer-embedded')
source=("https://www.signalyst.eu/bins/hqplayerd/noble/hqplayerd_"$_debpkgver"_amd64.deb"
        'hqplayerd.service'
        'hqplayerd_user.service'
        )
sha256sums=('96c6cc05d0a20973b93a3f53be34738c3e7473d56b804d7d872b3b42db05491e'
            '9aa79c67c22924c02b2c43cacbd3fac21dd9abbd146819ce46fe2b34f0193ef0'
            '5d4194a704979b3ff92482e155769460906745a66e759142eba33a2226f9cb3a')
install=${pkgname}.install

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
