_pkgname=jpeg2png
pkgname=${_pkgname}-ipep-git
pkgver=1.01.r4.g70f77db
pkgrel=1
pkgdesc='Silky smooth JPEG decoding - IPEP fork (includes fixes)'
arch=('x86_64' 'i686')
url="https://github.com/ImageProcessing-ElectronicPublications/${_pkgname}"
license=('GPL3')
depends=('libjpeg' 'libpng')
makedepends=('git')
provides=("${_pkgname}")
conflicts=(${provides[@]})
source=("${_pkgname}-git"::"git+https://github.com/ImageProcessing-ElectronicPublications/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}-git"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}-git"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-git"
  make DESTDIR="$pkgdir" install
}
