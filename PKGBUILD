# Maintainer: Alexandar <alex.goranov@gmail.com>
pkgname=rosepad
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple cross-platform text editor made for writing notes, letters, poems, and such with ease with a beautiful UI."
arch=('x86_64')
url="https://github.com/TMG8047KG/RosePad"
license=('GPL')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk')
options=('!strip' '!emptydirs')
provides=("${pkgname}")
source_x86_64=("https://github.com/TMG8047KG/RosePad/releases/download/v${pkgver}/rosepad_${pkgver}_amd64.deb")
sha256sums_x86_64=('09a04027df279c237b8ba767c2f96dff3ffbf1644d805bd5ad13adebff6e9785')

prepare() {
  # Extract the .deb package
  ar x "rosepad_${pkgver}_amd64.deb"
  tar -xf data.tar.gz
}

package() {
  # Create directories if they don't exist
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share"
  
  # Copy files from the extracted structure to the package directory
  cp -r usr/bin/* "$pkgdir/usr/bin/"
  cp -r usr/share/* "$pkgdir/usr/share/"
  
  # Make sure the executable has the right permissions
  chmod 755 "$pkgdir/usr/bin/rosepad"
  
  # If there are any desktop files, make sure they're properly set up
  if [ -f "$pkgdir/usr/share/applications/rosepad.desktop" ]; then
    chmod 644 "$pkgdir/usr/share/applications/rosepad.desktop"
  fi
  
  # If there are any icons, ensure they have correct permissions
  find "$pkgdir/usr/share/icons" -type f -exec chmod 644 {} \; 2>/dev/null || true
}