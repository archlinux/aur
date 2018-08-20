# Maintaienr: Niklas <dev@n1klas.net>
# Contributor: kevku <kevku@gmx.com>

pkgname=kodi-addon-inputstream-adaptive-18-git
pkgver=r371.430c440
pkgrel=2
pkgdesc="InputStream client for adaptive streams for Kodi 18"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/peak3d/inputstream.adaptive"
license=('GPL2')
depends=('kodi>=18.0')
makedepends=('kodi-dev>=18.0' 'cmake' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('kodi-addon-inputstream-adaptive-18-git::git+https://github.com/peak3d/inputstream.adaptive.git')
md5sums=('SKIP')

pkgver() {
        cd "${srcdir}/${pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "${srcdir}/${pkgname}"
        cmake -DCMAKE_INSTALL_PREFIX=/usr
        make
}

package() {
        cd "${srcdir}/${pkgname}"
        make DESTDIR="${pkgdir}" install
}
