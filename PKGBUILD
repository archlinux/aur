# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=airvpn-beta-bin
pkgver=2.16.1
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
md5sums_i686=('df2b377dd50daec58e5a452734f812a2')
md5sums_x86_64=('8d29c46025ce97436d8313c145330917')
sha256sums_i686=('65ad55c7bc8ee28fdb09a026bd44f4cf818da5ed1aee2fe9f892b70520cdde4c')
sha256sums_x86_64=('365375cafd30e5cece5d1057f73faf4a4e8b9b8ef4181d5725150e362d7239e4')

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
