# Maintainer: Sanjay Pavan <tsppavan7@gmail.com>

pkgname='nsxiv-git'
_pkgname=nsxiv
pkgver=28.r0.g7a94a5e
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
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  ln -s config.def.h config.h
}

build() {
  make -C "$_pkgname"
}

package() {
  cd "$srcdir/$_pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install-all
}
