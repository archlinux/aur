# Maintainer: Matthias Mailänder <matthias@mailaender.name>
pkgname=openhv
pkgver=20230416
pkgrel=1
pkgdesc="An open-source pixel-art science-fiction real-time-strategy game."
arch=('any')
url="https://www.openhv.net"
license=('GPL3')
depends=('dotnet-sdk-6.0' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme'
         'gtk-update-icon-cache' 'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('git' 'unzip')
options=(!debug)
source=("git+https://github.com/OpenHV/OpenHV.git#tag=${pkgver}")
sha512sums=('SKIP')

prepare() {
  cd OpenHV

  make version
}

build() {
  cd OpenHV

  make RUNTIME=net6 TARGETPLATFORM=unix-generic
}

package() {
  cd OpenHV

  make prefix=/usr TARGETPLATFORM=unix-generic DESTDIR="$pkgdir" install
}
