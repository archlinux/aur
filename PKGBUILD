## Maintainer: AudioLinux  audiolinux@fastmail.fm

pkgname=hqplayer-embedded-sse
_debpkgname=hqplayer-embedded
_debpkgver=4.33.1-146
_debpkgverarm=4.33.1-146
pkgver=4.33.1
pkgrel=1
pkgdesc="Signalyst HQPlayer Embedded
 HQPlayer - the high-end upsampling multichannel software HD-audio player"
arch=('x86_64' 'aarch64')
url="http://www.signalyst.com/custom.html"
license=('custom')
depends=('alsa-lib' 'glibc' 'libusb-compat' 'flac' 'gcc-libs' 'libgmpris' 'glib2' 'rygel' 'zip' 'unzip' 'wavpack' 'gupnp' 'openmp' 'mpg123' 'lame')
optdepends=('hqplayer-client')
conflicts=('hqplayer-embedded' 'hqplayer-embedded-amd' 'hqplayer-embedded-rocm' 'hqplayer4')
provides=('hqplayer')
source=('hqplayerd.service'
        'hqplayerd_user.service'
        )
source_x86_64=("https://www.signalyst.eu/bins/hqplayerd/jammy/hqplayerd_"$_debpkgver"_amd64.deb")
source_aarch64=("https://www.signalyst.eu/bins/hqplayerd/bullseye/hqplayerd_"$_debpkgverarm"_arm64.deb")
sha256sums=('9aa79c67c22924c02b2c43cacbd3fac21dd9abbd146819ce46fe2b34f0193ef0'
            '5d4194a704979b3ff92482e155769460906745a66e759142eba33a2226f9cb3a')
sha256sums_x86_64=('9c0c9bea42b61d884456e3fb9c8c96cd6adec0584d7047da772ba33262dabbaa')
sha256sums_aarch64=('85f59dcfae8ad55d5037197ba6ead4f28fdb818b6916c10597c61a2a19f824f7')
install=${pkgname}.install

package() {
 if [[ "$CARCH" = "x86_64" ]]; then
 bsdtar xf data.tar.zst -C "$pkgdir"
 else
 bsdtar xf data.tar.xz -C "$pkgdir"
 fi
  
  install -Dm644 "$pkgdir/usr/share/doc/hqplayerd/copyright" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 "hqplayerd_user.service" "$pkgdir/usr/lib/systemd/user/hqplayerd.service"
  install -Dm644 "hqplayerd.service" "$pkgdir/usr/lib/systemd/system/hqplayerd.service"
  
  rm -rf "$pkgdir/lib"
  rm "$pkgdir/usr/share/doc/hqplayerd/copyright"
  cp "$pkgdir"/opt/hqplayerd/lib/* "$pkgdir"/usr/lib/
  rm -rf "$pkgdir/opt"
  rm -rf "$pkgdir/etc/modules-load.d"
  rm -rf "$pkgdir/etc/udev"
}
