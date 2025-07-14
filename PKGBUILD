# Maintainer: Subhamoy Biswas <hey@neosubhamoy.com>
pkgname=neodlp
pkgver=0.2.0
pkgrel=1
pkgdesc="Cross-platform Video/Audio Downloader Desktop App with Modern UI and Browser Integration"
arch=('x86_64')
url="https://github.com/neosubhamoy/neodlp"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('curl' 'jq')
options=('!strip' '!emptydirs')
install=${pkgname}.install

pkgver() {
  # Get the latest release info using GitHub API
  local latest_tag=$(curl -s "https://api.github.com/repos/neosubhamoy/neodlp/releases/latest" | jq -r '.tag_name')
  
  # Extract version number from tag (remove the leading 'v' and any suffix after '-')
  # This will work with formats like v0.1.0, v0.1.0-beta, v1.0.0-stable, etc.
  echo "$latest_tag" | sed -E 's/^v([0-9]+\.[0-9]+\.[0-9]+)(-.*)?$/\1/'
}

prepare() {
  cd "$srcdir"
  mkdir -p extracted
  ar x NeoDLP_${pkgver}_amd64.deb
}

package() {
  tar -xf "$srcdir/data.tar.gz" -C "${pkgdir}"
}

source_x86_64=("NeoDLP_${pkgver}_amd64.deb::https://github.com/neosubhamoy/neodlp/releases/download/v$pkgver/NeoDLP_${pkgver}_amd64.deb")
sha256sums_x86_64=('SKIP')