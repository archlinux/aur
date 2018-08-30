# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

pkgname=airvpn-bin
pkgver=2.16.3
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
source_i686=("eddie-ui_${pkgver}_linux_x86_debian.deb::https://eddie.website/download/?platform=linux&arch=x86&ui=ui&format=debian.deb&version=${pkgver}")
source_x86_64=("eddie-ui_${pkgver}_linux_x64_debian.deb::https://eddie.website/download/?platform=linux&arch=x64&ui=ui&format=debian.deb&version=${pkgver}")
md5sums_i686=('e7034ab80cd7e8d33c2976e042d037ff')
md5sums_x86_64=('60e251845341843641d5682824ab23b9')
sha256sums_i686=('693cc9493bf44426b9bae8acb85f8f76728d0199ccdcce45d678221c90cb3de7')
sha256sums_x86_64=('23107d171ae00ab2aaa022c1c3a8f4a0ec8b140271cfc7036865c60e25e94ab8')

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
