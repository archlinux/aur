pkgname=curtail-git
pkgver=1.1.0+2+g6918486
pkgrel=1
pkgdesc="Simple & lossless image compressor."
arch=('any')
url="https://github.com/Huluti/Curtail"
license=('GPL3')
depends=('gtk3' 'python-gobject' 'jpegoptim' 'optipng' 'pngquant')
makedepends=('meson')
checkdepends=('appstream-glib')
provides=('curtail')
conflicts=('curtail' 'imcompressor')
source=("git+https://github.com/Huluti/Curtail.git")
b2sums=('SKIP')

pkgver() {
  cd Curtail
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson Curtail build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
