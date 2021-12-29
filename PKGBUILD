# Maintainer: Guilherme Rugai Freire <dev at grfreire dot com>

_appname_=sxiv
pkgname=${_appname_}-grfreire
pkgver=27
pkgrel=1
pkgdesc="GRFreire's Simple X Image Viewer fork"
arch=('x86_64')
url="https://github.com/GRFreire/sxiv"
license=('GPL2')
depends=('imlib2' 'desktop-file-utils' 'xdg-utils' 'hicolor-icon-theme' 'libexif' 'libxft' 'librsvg' 'cairo' 'curl' 'libwebp')
provides=(${_appname_})
conflicts=(${_appname_})
source=("${_appname_}-$pkgver.tar.gz"::"https://github.com/GRFreire/sxiv/archive/v$pkgver.tar.gz")
md5sums=('016f7d5cd431b1372bf9c12a55c96887')

prepare() {
  cd "${_appname_}-$pkgver"
  ln -s config.def.h config.h
}

build() {
  make -C "${_appname_}-$pkgver"
}

package() {
  cd "${_appname_}-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  make -C icon PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 sxiv.desktop "$pkgdir"/usr/share/applications/sxiv.desktop
}

