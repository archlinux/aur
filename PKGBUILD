# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=thunar-dropbox
pkgname=${_pkgname}-git
pkgver=0.3.1+0+gcb2070f
pkgrel=1
pkgdesc="Plugin for Thunar that adds context-menu items for Dropbox."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/Jeinzi/thunar-dropbox"
license=('GPL3')
depends=('thunar' 'dropbox')
makedepends=('git' 'cmake')
source=(git+https://github.com/Jeinzi/thunar-dropbox)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s:-:+:g"
}

build() {
  cd "${_pkgname}"

  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" .
  cmake --build build
}

package() {
  cd "${_pkgname}"
  cmake --build build --target install --config Release
}
