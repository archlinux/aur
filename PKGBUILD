## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-embedded
_rpmver=4.22.0-55
_debpkgver=4.22.0-61
pkgver=4.22.0
pkgrel=1
pkgdesc="Signalyst HQPlayer Embedded
 HQPlayer - the high-end upsampling multichannel software HD-audio player"
arch=('x86_64' 'aarch64')
url="http://www.signalyst.com/custom.html"
license=('custom')
depends=('alsa-lib' 'glibc' 'flac' 'gcc-libs' 'libgmpris' 'glib2' 'rygel' 'adduser-deb' 'zip' 'unzip' 'wavpack' 'gupnp' 'openmp')
source_x86_64=("https://www.signalyst.eu/bins/hqplayerd/fc33/hqplayerd-"$_rpmver".fc33.x86_64.rpm" 'hqplayerd.service')
install=install
source_aarch64=("https://www.signalyst.eu/bins/hqplayerd/buster/hqplayerd_"$_debpkgver"_arm64.deb" 'hqplayerd.service')
sha256sums_x86_64=('814cae50d6e44c75e86bccd0527adaa25852555bd188e680aeb8ab906f666022'
'5d4194a704979b3ff92482e155769460906745a66e759142eba33a2226f9cb3a')
sha256sums_aarch64=('51bc55ee8595698fc516244b847e12cebccb33f976a94bdaed42c08cce843396'
'5d4194a704979b3ff92482e155769460906745a66e759142eba33a2226f9cb3a')

package() {
  if [ "$arch" == "x86_64" ]; then
  bsdtar xf hqplayerd-"$_rpmver".fc33.x86_64.rpm -C "$pkgdir"
  else
  bsdtar xf hqplayerd_"$_debpkgver"_arm64.deb -C "$pkgdir"
  fi
  install -Dm644 "hqplayerd.service" "$pkgdir/usr/lib/systemd/user/hqplayerd.service"
  install -Dm644 "$pkgdir/usr/share/doc/hqplayerd/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  rm "$pkgdir/usr/share/doc/hqplayerd/LICENSE"
  cp "$pkgdir/etc/hqplayer/hqplayerd.xml" "$pkgdir/usr/share/doc/hqplayerd/hqplayerd.xml"
  rm "$pkgdir/etc/hqplayer/hqplayerd.xml"
  
  rm -rf "$pkgdir/etc/modules-load.d"
  rm -rf "$pkgdir/etc/udev"
}
