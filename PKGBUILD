# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx-git
pkgver=19.0.1.g5f30264
pkgrel=1
pkgdesc="A program for improving image files made with a digital camera, test-version"
url="http://www.kornelix.net/fotoxx/fotoxx.html"
arch=('i686' 'x86_64')
license=('GPL3')
conflicts=('fotoxx')
provides=('fotoxx')
depends=('libraw' 'gtk3' 'libchamplain' 'perl-image-exiftool>=0.8.6' 'xdg-utils')
optdepends=('rawtherapee: for raw image processing'
	    'dvd+rw-tools: for burning CDs,DVDs or BlueRays'
	    'hugin: for panorama photos')
source=("git+https://gitlab.com/${pkgname%-git}/${pkgname%-git}.git")
sha256sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | tr - .
}

build() {
  cd ${pkgname%-git}/programs/${pkgname%-git}
  make PREFIX=/usr
}

package() {
  cd ${pkgname%-git}/programs/${pkgname%-git}
  make DESTDIR="$pkgdir" PREFIX=/usr install
  rm -r "$pkgdir"/usr/share/appdata
}
