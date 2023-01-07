_pkgname=libiqa
pkgname=${_pkgname}-git
pkgver=1.1.2.1.r1.g5441721
pkgrel=1
pkgdesc='Image Quality Assessment (IQA) - fast, accurate, and reliable C library for measuring image quality'
arch=(x86_64)
url="https://github.com/ImageProcessing-ElectronicPublications/${_pkgname}"
license=(BSD)
depends=(glibc)
makedepends=(git)
optdepends=()
provides=("${_pkgname}")
conflicts=(${provides[@]})
source=("${_pkgname}-git"::"git+https://github.com/ImageProcessing-ElectronicPublications/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}-git"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}-git"
  make
}

package() {
  cd "${srcdir}/${_pkgname}-git"
  make PREFIX="$pkgdir/usr" install

  mkdir -p "$pkgdir/usr/share/licenses/libiqa-git"
  ln -s /usr/share/doc/libiqa1/LICENSE "$pkgdir/usr/share/licenses/libiqa-git/LICENSE"
}
