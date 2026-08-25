# Maintainer: Richard Smith <aur@electronstudio.co.uk>
pkgname=inara
pkgver=0.8.10
pkgrel=1
pkgdesc="Use mobile device as trackpad, graphics tablet, for PC."
arch=('x86_64')
url="https://github.com/electronstudio/desktop_remote_mobile_companion"
license=('GPL-3.0-only')
depends=('x264' 'gcc-libs' 'libglvnd' 'mesa' 'libx11' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi' 'wayland' 'libxkbcommon' 'libvdpau' 'alsa-lib' 'hicolor-icon-theme' 'libva' 'sndio' 'libxv')
makedepends=('go>=1.26' 'nasm')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/electronstudio/desktop_remote_mobile_companion/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('1c0be1fdec4daac1b908c2ca601f2fa626747a9b16de47dc35c8b522ad87e451')

build() {
  cd "$srcdir/desktop_remote_mobile_companion-$pkgver"
  export GOFLAGS=-buildvcs=false
  export CGO_CFLAGS=""
  export CGO_LDFLAGS=""
  export CFLAGS="-march=native -O3"
  export CXXFLAGS="-march=native -O3"
  export LDFLAGS=""
  export LTOFLAGS=""
  make -f Makefile
}

package() {
  cd "$srcdir/desktop_remote_mobile_companion-$pkgver"
  make -f Makefile install DESTDIR="$pkgdir" PREFIX=/usr
  rm -f "$pkgdir/usr/share/applications/mimeinfo.cache"
  rm -f "$pkgdir/usr/share/icons/hicolor/icon-theme.cache"
}
