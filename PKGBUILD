# Maintainer: Sanjay Pavan <tsppavan7@gmail.com>

pkgname='nsxiv-git'
_pkgname=nsxiv
pkgver=27.1.r825.d0b5005
pkgrel=1
pkgdesc='Neo (or New or Not) Simple (or Small or Suckless) X Image Viewer (GIT VERSION)'
arch=('x86_64')
license=('GPL2')
conflicts=('nsxiv')
url='https://github.com/nsxiv/nsxiv.git'
depends=('imlib2' 'desktop-file-utils' 'xdg-utils' 'hicolor-icon-theme' 'libexif' 'libxft' 'giflib' 'libwebp')
makedepends=(git)
source=("${_pkgname}::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "27.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
  cd "$_pkgname"
  ln -s config.def.h config.h
}

build() {
  make -C "$_pkgname"
}

package() {
  cd "$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install-all
}
