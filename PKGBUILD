# Maintainer: JonasAlv
pkgname=zap-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple and minimal web wrapper for WhatsApp Web"
arch=('x86_64')
url="https://github.com/JonasAlv/zap-rs"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libsoup' 'glib2' 'pango' 'gdk-pixbuf2' 'cairo' 'desktop-file-utils' 'hicolor-icon-theme')
install="$pkgname.install"
source=("${pkgname}_${pkgver}_amd64.deb::$url/releases/download/v$pkgver/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
  cd "$srcdir"

  # Extract the .deb package
  bsdtar -xf "${pkgname}_${pkgver}_amd64.deb"

  # Extract the data archive inside it (this is the payload)
  if [[ -f data.tar.xz ]]; then
    bsdtar -xf data.tar.xz -C "$pkgdir"
  elif [[ -f data.tar.gz ]]; then
    bsdtar -xf data.tar.gz -C "$pkgdir"
  else
    echo "No data.tar.* archive found in the .deb"
    return 1
  fi
}
