# Maintainer: Eddie.website <maintainer@eddie.website>
# Based on work by Uncle Hunto - https://aur.archlinux.org/account/uncle

pkgname=eddie-ui
pkgver=2.14.4
pkgrel=1
pkgdesc='Eddie - OpenVPN UI'
arch=('i686' 'x86_64')
url=https://eddie.website
license=(GPL3)
depends=(mono openvpn sudo libnotify libappindicator-gtk2)
optdepends=('stunnel: VPN over SSL' 'openssh: VPN over SSH')
provides=('eddie-ui')
conflicts=('airvpn' 'airvpn-beta-bin')
install=eddie-ui.install
#source_i686=("eddie-ui_linux_x86_debian_${pkgver}.deb::https://eddie.website/download/?platform=linux&arch=x86&ui=ui&format=debian.deb&version=${pkgver}")
#source_x86_64=("eddie-ui_linux_x64_debian_${pkgver}.deb::https://eddie.website/download/?platform=linux&arch=x64&ui=ui&format=debian.deb&version=${pkgver}")
source_i686=("eddie-ui_linux_x86_debian_${pkgver}.deb::https://eddie.website/download/?platform=linux&arch=x86&ui=ui&format=debian.deb&version=experimental")
source_x86_64=("eddie-ui_linux_x64_debian_${pkgver}.deb::https://eddie.website/download/?platform=linux&arch=x64&ui=ui&format=debian.deb&version=experimental")

#md5sums_i686=('ff5f5d71fabd6f9dca0f1350449ecc17')
#md5sums_x86_64=('b34bbe4571f3a3849eb53345a6a03c89')
#sha256sums_i686=('19394ece88ceadc539cac159f96298919e94134bcaf78116be4b6d93035b9aea')
#s256sums_hax86_64=('be5b1f941dae8265344da2d0d94847fd13c669bcfc5618d5d1af689138473406')

package() {
  msg2 "Extracting the data.tar.lzma..."
  bsdtar -xf data.tar.gz

  msg2 "Moving stuff in place..."
  install -Dm755 "$srcdir/usr/lib/eddie-ui/Eddie-UI.exe"         "$pkgdir/usr/lib/eddie-ui/Eddie-UI.exe"
  install -Dm644 "$srcdir/usr/lib/eddie-ui/Lib.Common.dll"     "$pkgdir/usr/lib/eddie-ui/Lib.Common.dll"
  install -Dm644 "$srcdir/usr/lib/eddie-ui/Lib.Core.dll"       "$pkgdir/usr/lib/eddie-ui/Lib.Core.dll"
  install -Dm644 "$srcdir/usr/lib/eddie-ui/Lib.Forms.dll"      "$pkgdir/usr/lib/eddie-ui/Lib.Forms.dll"
  install -Dm644 "$srcdir/usr/lib/eddie-ui/Lib.Platform.Linux.dll" \
                 "$pkgdir/usr/lib/eddie-ui/Lib.Platform.Linux.dll"
  install -Dm644 "$srcdir/usr/lib/eddie-ui/libLib.Platform.Linux.Native.so" \
                 "$pkgdir/usr/lib/eddie-ui/libLib.Platform.Linux.Native.so"
  install -Dm755 "$srcdir/usr/lib/eddie-ui/eddie_tray" "$pkgdir/usr/lib/eddie-ui/eddie_tray"
  install -Dm755 "$srcdir/usr/lib/eddie-ui/update-resolv-conf" "$pkgdir/usr/lib/eddie-ui/update-resolv-conf"
  install -Dm755 "$srcdir/usr/bin/eddie-ui"                    "$pkgdir/usr/bin/eddie-ui"
  install -Dm644 "$srcdir/usr/share/eddie-ui/cacert.pem"       "$pkgdir/usr/share/eddie-ui/cacert.pem"
  install -Dm644 "$srcdir/usr/share/eddie-ui/icon.png"       "$pkgdir/usr/share/eddie-ui/icon.png"
  install -Dm644 "$srcdir/usr/share/eddie-ui/icon_gray.png"       "$pkgdir/usr/share/eddie-ui/icon_gray.png"
  install -Dm644 "$srcdir/usr/share/doc/eddie-ui/changelog.Debian.gz" "$pkgdir/usr/share/doc/eddie-ui/changelog.gz"
  install -Dm644 "$srcdir/usr/share/doc/eddie-ui/copyright"    "$pkgdir/usr/share/doc/eddie-ui/copyright"
  install -Dm644 "$srcdir/usr/share/man/man8/eddie-ui.8.gz"    "$pkgdir/usr/share/man/man1/eddie-ui.8.gz"
  install -Dm644 "$srcdir/usr/share/polkit-1/actions/com.eddie.linux.ui.policy" \
                 "$pkgdir/usr/share/polkit-1/actions/com.eddie.linux.ui.policy"

  ## Fix .desktop file for KDE
  _desktop_session=$(printf "%s" "$DESKTOP_SESSION" | awk -F "/" '{print $NF}')
  if [ "$_desktop_session" = "plasma" ]; then
    msg2 "Installing desktop file for KDE..."
    install -Dm644 "$srcdir/usr/share/pixmaps/eddie-ui.png"  "$pkgdir/usr/share/pixmaps/eddie-ui.png"
    cp "$srcdir/usr/share/applications/eddie-ui.desktop" "$srcdir/eddie-ui.desktop"
    desktop-file-install -m 644 --set-comment="OpenVPN UI" \
    --dir="$pkgdir/usr/share/applications/" \
    --set-icon="/usr/share/pixmaps/eddie-ui.png" "eddie-ui.desktop"
  else
  msg2 "Installing desktop file..."
  install -Dm644 "$srcdir/usr/share/pixmaps/eddie-ui.png"  "$pkgdir/usr/share/pixmaps/eddie-ui.png"
  desktop-file-install -m 644 --set-comment="OpenVPN UI" \
  --dir="$pkgdir/usr/share/applications/" "$srcdir/usr/share/applications/eddie-ui.desktop"
  fi
}


md5sums_i686=('91b6c9c1acb8e3b6cdef7c3e63eb1617')
md5sums_x86_64=('cae507d21b3417e3f0a76c9d1dfbff7d')
