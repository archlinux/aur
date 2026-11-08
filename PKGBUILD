# Maintainer: Matthias Mailänder <matthias@mailaender.name>
pkgname=openhv
pkgver=20261108
pkgrel=1
pkgdesc="An open-source pixel-art science-fiction real-time-strategy game."
arch=('any')
url="https://www.openhv.net"
license=('GPL3')
depends=('dotnet-sdk-10.0' 'openal' 'libgl' 'freetype2' 'sdl2' 'lua51' 'hicolor-icon-theme'
         'gtk-update-icon-cache' 'desktop-file-utils' 'xdg-utils' 'zenity')
makedepends=('git' 'unzip')
options=(!debug)
source=("git+https://github.com/OpenHV/OpenHV.git#tag=${pkgver}")
sha256sums=('32b6c29a2cba76a12bc3ed0bdb7ac131480def0f86b6681ff5e5c322d6db6fa2')

prepare() {
  cd OpenHV

  make version
}

build() {
  cd OpenHV

  make DEPENDENCIES=system
}

package() {
  cd OpenHV

  make prefix=/usr DESTDIR="$pkgdir" install
}
