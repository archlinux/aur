# Maintainer: Shatur <genaloner@gmail.com>

pkgname=crow-translate-git
pkgver=r15.766cc68
pkgrel=1
pkgdesc="A simple and lightweight translator that allows to translate and speak the selected text using the Google Translate API"
arch=('x86_64')
url="https://github.com/Shatur95/Crow"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'gst-plugins-good' 'openssl')
makedepends=('qt5-tools')
provides=('crow')
source=("git+https://github.com/Shatur95/CrowTranslate.git")
sha256sums=('SKIP')

# Clone submodules
prepare() {
  cd "${srcdir}/CrowTranslate"
  git submodule init
  git submodule update
}

pkgver() {
  cd "${srcdir}/CrowTranslate"

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/CrowTranslate"
  qmake
  make
}

package() {
  cd "${srcdir}/CrowTranslate"
  make INSTALL_ROOT="$pkgdir/" install
} 
