# Maintainer: Subhamoy Biswas <hey@neosubhamoy.com>
pkgname=pytubepp-helper
pkgver=0.8.0
pkgrel=1
pkgdesc="A Helper App for PytubePP Extension/Addon to Communicate with Pytube Post Processor CLI"
arch=('x86_64')
url="https://github.com/neosubhamoy/pytubepp-helper"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1' 'python-pip' 'ffmpeg' 'gnome-terminal' 'nodejs-lts-iron' 'npm')
makedepends=('curl' 'jq')
options=('!strip' '!emptydirs')
install=${pkgname}.install

pkgver() {
  # Get the latest release info using GitHub API
  local latest_tag=$(curl -s "https://api.github.com/repos/neosubhamoy/pytubepp-helper/releases/latest" | jq -r '.tag_name')
  
  # Extract version number from tag (remove the leading 'v' and any suffix after '-')
  # This will work with formats like v0.8.0-beta, v1.0.0-stable, etc.
  echo "$latest_tag" | sed -E 's/^v([0-9]+\.[0-9]+\.[0-9]+)(-.*)?$/\1/'
}

# Get suffix from tag (like -beta, -stable, etc.)
_get_suffix() {
  local latest_tag=$(curl -s "https://api.github.com/repos/neosubhamoy/pytubepp-helper/releases/latest" | jq -r '.tag_name')
  
  # Extract suffix after the version number (including the '-')
  # If no suffix is present, returns empty string
  echo "$latest_tag" | sed -E 's/^v[0-9]+\.[0-9]+\.[0-9]+(-.*)?$/\1/'
}

prepare() {
  cd "$srcdir"
  mkdir -p extracted
  ar x ${pkgname}_${pkgver}_amd64.deb
}

package() {
  tar -xf "$srcdir/data.tar.gz" -C "${pkgdir}"
}

source_x86_64=("${pkgname}_${pkgver}_amd64.deb::https://github.com/neosubhamoy/pytubepp-helper/releases/download/v$pkgver$(_get_suffix)/pytubepp-helper_${pkgver}_amd64.deb")
sha256sums_x86_64=('SKIP')