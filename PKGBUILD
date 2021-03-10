## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-embedded
_rpmver=4.22.3-59
_debpkgver=4.22.3-67
pkgver=4.22.3
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
sha256sums_x86_64=('b98933a9c898fe14abcef0e8ec64657d737cfdf4b3678fc67c1f887776fff0e1'
'5d4194a704979b3ff92482e155769460906745a66e759142eba33a2226f9cb3a')
sha256sums_aarch64=('5ee9595652b3289fe96ad5f33102fd062d2583a1eeb65fb615293067a8d9d8f8'
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
