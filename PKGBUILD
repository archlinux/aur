# Maintainer: 9M2PJU <9m2pju@gmail.com>
pkgname=aprstac-bin
pkgver=0.1.9
pkgrel=1
pkgdesc="A modern APRS web client, digipeater, IGate, BBS, and fileshare (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://aprstac.com/"
license=('custom:proprietary')
depends=()
provides=('aprstac')
conflicts=('aprstac')
source=('LICENSE')
source_x86_64=("aprstac-${pkgver}-x86_64.deb::https://aprstac.com/downloads/aprstac_${pkgver}_amd64.deb")
source_aarch64=("aprstac-${pkgver}-aarch64.deb::https://aprstac.com/downloads/aprstac_${pkgver}_arm64.deb")
sha256sums=('d2309a72446dac53dbe391ec2e8972f2fccbc6a06ab144c9011d5bd419c998e7')
sha256sums_x86_64=('cc8e690ef6ec6c40a3839502bb2b3ea1b77e2e61d737ae54530c13f0d9004025')
sha256sums_aarch64=('358387279d4575210b720743025da194528515f860bae34481134f0e63f74e9d')

package() {
  # Extract data.tar.xz to the package root.
  # makepkg automatically extracts the downloaded .deb ar archive into $srcdir.
  # We extract the inner data archive to $pkgdir.
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir/"

  # Align systemd service path with Arch Linux packaging standards
  # (Debian uses /etc/systemd/system, Arch packages use /usr/lib/systemd/system)
  install -d "$pkgdir/usr/lib/systemd/system"
  mv "$pkgdir/etc/systemd/system/aprstac.service" "$pkgdir/usr/lib/systemd/system/"
  rm -rf "$pkgdir/etc"

  # Install the custom license file
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
