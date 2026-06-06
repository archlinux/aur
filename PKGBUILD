# Maintainer: Alessandro Abbenante <alessandros.hube@gmail.com>

pkgname=psiphonlinuxgui
pkgver=1.5.0
pkgrel=1
pkgdesc="PsiphonLinuxGUI is an unofficial Linux app for managing the Psiphon VPN and browser settings."
arch=('x86_64')
url="https://github.com/Alessandros-Hube/PsiphonLinuxGUI"
license=('MIT')
depends=('nodejs')

source=("https://github.com/Alessandros-Hube/PsiphonLinuxGUI/releases/download/v$pkgver/psiphonlinuxgui_"$pkgver"_amd64.deb")
sha256sums=('e2f7a94796187367eb7ab2880ac6eb1737e73c84ca43f87db2652bde7bcb9866')

package() {
  # Extract the .deb package
  cd "$srcdir"
  ar x "psiphonlinuxgui_"$pkgver"_amd64.deb"  # Unpack the .deb package (ar command)
  tar xf data.tar.* -C "$pkgdir"  # Extract the data tarball to the package directory

  # If necessary, adjust extraction paths, for example:
  # Copy the necessary files into the correct directories:
  install -dm755 "$pkgdir/opt/psiphonlinuxgui"  # Create the target directory for Psiphon Linux GUI
  install -dm755 "$pkgdir/usr/share/applications"  # Create the applications directory for desktop files

  # Make sure the file exists
  if [ -e "$pkgdir/usr/share/applications/psiphonlinuxgui.desktop" ]; then
    # Modify the Exec line in the .desktop file to add the --no-sandbox parameter
    sed -i 's|Exec=.*|& --no-sandbox|' "$pkgdir/usr/share/applications/psiphonlinuxgui.desktop"
  fi

  mkdir -p "$pkgdir/usr/local/bin/"
  ln -sf "/opt/psiphonlinuxgui/psiphonlinuxgui" "$pkgdir/usr/local/bin/psiphonlinuxgui"
}
