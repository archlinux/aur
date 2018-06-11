# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=airvpn-bin
pkgver=2.14.5
pkgrel=1
pkgdesc='AirVPN client "Eddie" based on OpenVPN, stable version.'
arch=('i686' 'x86_64')
url=https://airvpn.org/linux/
license=(GPL3)
depends=(sudo mono openvpn curl libnotify)
optdepends=('stunnel: VPN over SSL' 'openssh: VPN over SSH' 'libappindicator-gtk2: Tray icon w/GTK 2' 'libappindicator-gtk3: Tray icon w/GTK 3')
provides=('airvpn')
conflicts=('airvpn' 'airvpn-beta-bin')
install=airvpn.install
source_i686=("airvpn_linux_x86_debian_${pkgver}.deb::https://eddie.website/download/?platform=linux&arch=x86&ui=ui&format=debian.deb&version=${pkgver}")
source_x86_64=("airvpn_linux_x64_debian_${pkgver}.deb::https://eddie.website/download/?platform=linux&arch=x64&ui=ui&format=debian.deb&version=${pkgver}")
md5sums_i686=('ee8d6397414682d7babe93cab448917e')
md5sums_x86_64=('30459acc1ab874c62258dc7ba7ee3a8b')
sha256sums_i686=('20fe67958405454435b7b47cddd95457f0edf256c013ac9b9606884f44a679d9')
sha256sums_x86_64=('6fa3d6185b5dcc03a2d3be942289a5d3e11a44c7b9bb42e12434f83db50ade15')

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
