# Maintainer: librewish <librewish at gmail dot com>


pkgname=ksmoothdock-git
pkgver=r550.793b94e
pkgrel=1
pkgdesc='A cool desktop panel for KDE Plasma 5'
arch=(any)
url='https://github.com/dangvd/ksmoothdock'
license=('GPL3')
depends=('kactivities' 'kxmlgui')
makedepends=('cmake' 'extra-cmake-modules' 'python')
source=("git+${url}")
sha256sums=('SKIP')
provides=("${pkgname}" "ksmoothdock")
conflicts=("ksmoothdock")

pkgver() {
	cd "$srcdir/ksmoothdock"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
  cd ${srcdir}/ksmoothdock

  cmake src \
    -DCMAKE_INSTALL_PREFIX=/usr \
  
  make
    
  }

package() {
  make -C ${srcdir}/ksmoothdock DESTDIR="$pkgdir" install
}
