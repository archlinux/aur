# Contributor: Edvinas Valatka <edacval@gmail.com>
# Maintainer: Edvinas Valatka <edacval@gmail.com>
_pkgname=seafile-client
pkgname=${_pkgname}-qt5
pkgver=5.1.0
pkgrel=1
pkgdesc="Seafile GUI client for synchronizing your local files with seafile server. Qt5 version."
arch=('i686' 'x86_64')
url="https://github.com/haiwen/seafile-client/"
license=('Apache')
depends=("seafile-shared" "qt5-webkit" "qt5-base" "gtk-update-icon-cache" "qt5-webengine")
makedepends=("cmake" "qt5-tools" "seafile-shared>=${pkgver}")
options=('!libtool' '!emptydirs')
conflicts=('seafile-client')
install=seafile-client-qt5.install
source=("${_pkgname}-v${pkgver}.tar.gz::https://github.com/haiwen/${_pkgname}/archive/v${pkgver}.tar.gz")

build () {
    cd "$srcdir/${_pkgname}-${pkgver}"
    cmake -DUSE_QT5=ON -DBUILD_SHIBBOLETH_SUPPORT=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package () {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
sha256sums=('d2046b52abc630704ec4aacaf9b308dabea40c020efd7e31cf3d81a8b408f5db')
