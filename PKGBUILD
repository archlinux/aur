# Maintainer: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: localizator <localizator@ukr.net>
# Contributor: Edvinas Valatka <edacval@gmail.com>

pkgname=seafile-client
pkgver=6.0.0
pkgrel=1
pkgdesc="GUI client for synchronizing your local files with seafile server"
arch=('i686' 'x86_64')
url="https://github.com/haiwen/seafile-client/"
license=('Apache')
depends=("seafile-shared" "qt5-webkit" "qt5-base" "gtk-update-icon-cache" "qt5-webengine")
makedepends=("cmake" "qt5-tools" "seafile-shared>=${pkgver}")
conflicts=('seafile-client-qt5')
provides=('seafile-client-qt5')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/haiwen/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('06a32b0ce34ab7f0ef298520f9ef4b24c1b9c4c2e5a8d8f248cc444ef6bd0544')

build () {
    cd "$srcdir/${pkgname}-${pkgver}"
    cmake -DBUILD_SHIBBOLETH_SUPPORT=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package () {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
