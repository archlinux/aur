## Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=hqplayer-embedded
_rpmver=4.21.1-54
_debpkgver=4.21.1-60
pkgver=4.21.1
pkgrel=2
pkgdesc="Signalyst HQPlayer Embedded
 HQPlayer - the high-end upsampling multichannel software HD-audio player"
arch=('x86_64' 'aarch64')
url="http://www.signalyst.com/custom.html"
license=('custom')
depends=('alsa-lib' 'glibc' 'flac' 'gcc-libs' 'libgmpris' 'glib2' 'rygel' 'adduser-deb' 'zip' 'unzip' 'wavpack' 'gupnp' 'openmp')
source_x86_64=("https://www.signalyst.eu/bins/hqplayerd/fc33/hqplayerd-"$_rpmver".fc33.x86_64.rpm" 'hqplayerd.service')
install=install
source_aarch64=("https://www.signalyst.eu/bins/hqplayerd/buster/hqplayerd_"$_debpkgver"_arm64.deb" 'hqplayerd.service')
sha256sums_x86_64=('a6d81d3ef3e4a8781ffce808c6f410d26d13720dafbb91fe7e8e6ccce16f972e'
'5d4194a704979b3ff92482e155769460906745a66e759142eba33a2226f9cb3a')
sha256sums_aarch64=('91a54b739a9b4106447cbd6497cc34291dc46de200661a76f53d73b1825393b3'
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
