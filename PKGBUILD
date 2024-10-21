# Maintainer: SINTES stahlbergindustries@gmail.com
# This package is in no way affiliated with or endorsed by Tradingview. The package maintainer is in no way affiliated with Tradingview.
_basepkgname=tradingview
pkgname=${_basepkgname}-bin
pkgver=2.9.3
pkgrel=1
epoch=1
pkgdesc="My port of the Tradingview deb desktop app to Archlinux"
arch=('x86_64')
url="https://www.tradingview.com/desktop/"
license=('custom:Proprietary')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux' 'libsecret')
install=$pkgname.install
source=("https://tvd-packages.tradingview.com/ubuntu/stable/latest/jammy/${_basepkgname}_amd64.deb")
sha256sums=('b9a89be0e29b49150af6cf32732aec184b425f472f3db28180dd3e744392c1d5')
package() {
  echo "  -> Extracting the data.tar.xz"
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  # Remove Debian-specific files
  rm -f "$pkgdir"/{control.tar.gz,data.tar.xz,debian-binary}
  # Ensure proper permissions for the main executable
  chmod 755 "$pkgdir/opt/TradingView/${_basepkgname}"
  # Create symlink for the binary
  mkdir -p "$pkgdir/usr/bin"
  ln -sf "/opt/TradingView/${_basepkgname}" "$pkgdir/usr/bin/${_basepkgname}"
}
