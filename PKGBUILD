## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-embedded
_rpmver=4.22.1-57
_debpkgver=4.22.0-63
pkgver=4.22.1
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
sha256sums_x86_64=('606840bc198532289ccb1980c9e85c1cb63e09ee90c5fbc793c7d446b0308d87'
'5d4194a704979b3ff92482e155769460906745a66e759142eba33a2226f9cb3a')
sha256sums_aarch64=('a6d0063f866499b4dd35fe43f1e1f6d147f528fdf34c085aea2980cfd8373a47'
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
