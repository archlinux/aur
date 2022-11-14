# Contributor: Eric Fung <loseurmarbles[AT]gmail[DOT]com>
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Andrea Scarpino <bash.lnx@gmail.com>
# Contributor: Federico Quagliata (quaqo) <quaqo@despammed.com>

pkgname=camorama
pkgver=0.21.2
pkgrel=1
pkgdesc="GNOME 3 Webcam application featuring various image filters"
url="https://github.com/alessio/camorama"
arch=('x86_64')
license=('GPL2')
depends=('gtk3' 'v4l-utils')
makedepends=('gnome-common')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${url}/archive/refs/tags/0.21.2.tar.gz" '3e2e3de.patch')
sha256sums=('434ea95081b90f88f8dd6d67d6d9d4a517d55d83da9f04870bb27633511c5d39'
            '9d9ab85eee0f18ea2f696dc8ac072483de84a2b44845d2d01a8f05eb280ea14e')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 <../3e2e3de.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" make install
}
