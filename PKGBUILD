# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=uxplay-git
_gitname=UxPlay
pkgver=r17.6a473d6
pkgrel=1
pkgdesc="AirPlay Unix mirroring server"
arch=('any')
url="https://github.com/antimof/$_gitname"
license=('GPL3')
depends=('gstreamer' 'gst-plugins-base' 'gst-plugins-base-libs' 'gst-libav' 'gstreamer-vaapi')
conflicts=('uxplay')
provides=('uxplay')
source=("git+$url.git" "uxplay.desktop")
sha256sums=('SKIP' '6b43385942508d8c360e8360be52719cbf3899868f3560b245731d866fb245a3')

pkgver() {
  cd "$srcdir/$_gitname"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_gitname"
  mkdir -p build
  cd build
  cmake ..
  make
}

package() {
  # install binary
  install -Dm 755 "$srcdir/$_gitname/build/uxplay" "$pkgdir/usr/bin/uxplay"
  # install desktop file
  install -Dm 644 "$srcdir/uxplay.desktop" "$pkgdir/usr/share/applications/uxplay.desktop"
}
