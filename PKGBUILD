pkgname=qolibri
pkgver=2.1.2
pkgrel=1
pkgdesc="A QT-based EPWING dictionary viewer"
url="https://github.com/ludios/qolibri/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('qt5-base' 'qt5-tools' 'qt5-multimedia' 'qt5-webengine' 'zlib' 'eb-library')
makedepends=('cmake')
source=("https://github.com/ludios/qolibri/archive/${pkgver}.tar.gz"
        'qolibri.desktop'
        'qolibri-128.png')
md5sums=('94c58051989d05ed3d1e1393a79bff2a'
         '9c68770443635f3718d8d291f260de10'
         '85bd387834f16a9ee92824acfcdfd5f2')

prepare () {
  mkdir -p -- build
}

build() {
  cd build
  cmake "../${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  cd "$srcdir"
  install -Dm644 qolibri-128.png "$pkgdir"/usr/share/qolibri/icon.png
  install -Dm644 qolibri.desktop "$pkgdir"/usr/share/applications/qolibri.desktop
}
