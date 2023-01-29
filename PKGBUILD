_pkgname=jpeg2png
pkgname="$_pkgname-ipep-git"
pkgver=1.01.r5.g7ae6e42
pkgrel=1
pkgdesc='Silky smooth JPEG decoding - IPEP fork (includes fixes)'
arch=('x86_64' 'i686')
url="https://github.com/ImageProcessing-ElectronicPublications/jpeg2png"
license=('GPL3')
depends=('libjpeg' 'libpng')
makedepends=('git')
provides=("$_pkgname")
conflicts=(${provides[@]})
source=("$_pkgname"::"git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
