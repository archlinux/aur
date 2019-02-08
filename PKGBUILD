# Maintaienr: Niklas <dev@n1klas.net>
# Contributor: kevku <kevku@gmx.com>

pkgname=kodi-addon-inputstream-adaptive-18-git
pkgver=2.3.13.r3.gf782dcc
pkgrel=1
pkgdesc="InputStream client for adaptive streams for Kodi 18"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/peak3d/inputstream.adaptive"
license=('GPL2')
depends=('kodi>=18')
makedepends=('kodi-dev>=18' 'cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/peak3d/inputstream.adaptive.git")
md5sums=('SKIP')

prepare() {
  mkdir -p "${srcdir}/${pkgname}/build"
}

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="${pkgdir}" install
}
