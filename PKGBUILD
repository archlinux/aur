# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=airvpn-beta-bin
pkgver=2.17.2
pkgrel=1
pkgdesc='AirVPN client "Eddie" based on OpenVPN, beta version.'
arch=('i686' 'x86_64')
url=https://airvpn.org/linux/
license=(GPL3)
depends=(sudo mono openvpn curl libnotify)
optdepends=('stunnel: VPN over SSL' 'openssh: VPN over SSH' 'libappindicator-gtk2: Tray icon w/GTK 2' 'libappindicator-gtk3: Tray icon w/GTK 3')
provides=('airvpn')
conflicts=('airvpn' 'airvpn-bin')
install=airvpn.install
source_i686=("eddie-ui_${pkgver}_linux_x86_debian.deb"::'https://eddie.website/download/?platform=linux&arch=x86&ui=ui&format=debian.deb&version=experimental')
source_x86_64=("eddie-ui_${pkgver}_linux_x64_debian.deb"::'https://eddie.website/download/?platform=linux&arch=x64&ui=ui&format=debian.deb&version=experimental')
md5sums_i686=('bf21f391fd9617df5c2c30ac0a7e1a83')
md5sums_x86_64=('46fc6a1c06f297dd897af1b190a3a92f')
sha256sums_i686=('989a2cba17b4d786152feb7fa1d12c7e240ad8885c350d2c23d09420eea35098')
sha256sums_x86_64=('acb05d27b027c7d3cafb9e0bf7c7e406a0b2d6be2ff0d079eab8847bea4c97ce')

package() {
  cd "$srcdir"
  msg2 "Extracting the data.tar.gz..."
  bsdtar -xf "$srcdir/data.tar.gz"

  msg2 "Moving stuff in place..."
  for _file in usr/{bin/*,lib/eddie-ui/*,share/{applications/*,doc/eddie-ui/*,eddie-ui/*,man/man8/*,pixmaps/*,polkit-1/actions/*}}; do
    _octal=$(stat -c "%a" "$_file")
    install -Dm"${_octal}" "$_file" "${pkgdir}/$_file"
  done
}
