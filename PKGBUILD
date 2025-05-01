# Maintainer: DreamMaoMao <maoopzopaasnmakslpo@gmail.com>
pkgname=rofi-blocks-meson-git
_gitroot='rofi-blocks'
pkgver=r170.d75a9da
pkgrel=1
pkgdesc="rofi modi for controlling rofi content through communication with an external program"
arch=("any")
url="https://github.com/OmarCastro/${_gitroot}"
license=('GPL')
depends=(rofi json-glib)
conflicts=('rofi-block' 'rofi-blocks-git')
makedepends=(git meson ninja)
optdepends=()
source=("git+https://github.com/OmarCastro/${_gitroot}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitroot}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD | sed 's/-/./g')"
}

build() {  
  arch-meson $_gitroot build 
  ninja -C build
}

package() {
  DESTDIR="$pkgdir/" ninja -C build install
}
