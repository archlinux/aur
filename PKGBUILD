# Maintainer: Shatur <genaloner@gmail.com>

pkgname=crow-translate-git
pkgver=0.9.5.r0.g7c4b066
pkgrel=1
pkgdesc="A simple and lightweight translator that allows to translate and speak the selected text using the Google Translate API"
arch=('x86_64')
url="https://github.com/Shatur95/Crow"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'gst-plugins-good' 'openssl')
makedepends=('qt5-tools' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/Shatur95/CrowTranslate.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

# Clone submodules
prepare() {
  cd "${pkgname%-git}"
  
  git submodule init
  git submodule update
}

build() {
  cd "${pkgname%-git}"
  
  qmake
  make
}

package() {
  cd "${pkgname%-git}"
  
  make INSTALL_ROOT="$pkgdir/" install
} 
