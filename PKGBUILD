# Maintainer: Shatur <genaloner@gmail.com>

pkgname=crow-translate-git
pkgver=r26.abe8009
pkgrel=1
pkgdesc="A simple and lightweight translator that allows to translate and speak the selected text using the Google Translate API"
arch=('x86_64')
url="https://github.com/Shatur95/Crow"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'gst-plugins-good' 'openssl')
makedepends=('qt5-tools')
provides=('crow')
source=("${pkgname%-*}::git+https://github.com/Shatur95/CrowTranslate.git")
sha256sums=('SKIP')

# Clone submodules
prepare() {
  cd ${pkgname%-*}
  
  git submodule init
  git submodule update
}

pkgver() {
  cd ${pkgname%-*}

  # Get the version number.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname%-*}
  
  qmake
  make
}

package() {
  cd ${pkgname%-*}
  
  make INSTALL_ROOT="$pkgdir/" install
} 
