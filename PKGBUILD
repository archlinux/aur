# Maintainer: Audiolinux  audiolinux@fastmail.fm

pkgname=audirvana-studio
pkgver=3.0
pkgrel=1
pkgdesc="Audirvana Studio audio player"
arch=('x86_64')
url="https://audirvana.com/"
license=('custom')
depends=('glibc' 'gcc-libs' 'alsa-lib' 'avahi' 'curl' 'libxml2')
source=("https://audirvana.com/delivery/linux/apt-repo/pool/non-free/audirvana-studio/audirvana-studio_"$pkgver"_amd64.deb" 'audirvanaStudio.service')
sha256sums=('b3c65975aa0c255000bcd42ea3c08c738b4361f41753a4cc3248470dcfff7553' 
'd1750d6eb360f3d348b2a016288ca4dae3ed544bbe62c1d802fa0fb59c487658')
install=${pkgname}.install

package() {
bsdtar xf data.tar.gz -C "$pkgdir"
install -Dm644 "audirvanaStudio.service" "$pkgdir/usr/lib/systemd/user/audirvanaStudio.service"
install -Dm644 "$pkgdir/opt/audirvana/studio/share/CREDITS" "$pkgdir/usr/share/licenses/$pkgname/CREDITS"
install -Dm644 "$pkgdir/opt/audirvana/studio/share/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
chmod 4755 "$pkgdir/opt/audirvana/studio/smb_mount_helper"
rm -rf "$pkgdir/opt/audirvana/studio/share/etc"
rm -f "$pkgdir/opt/audirvana/studio/share/CREDITS"
rm -f "$pkgdir/opt/audirvana/studio/share/LICENSE"
}
