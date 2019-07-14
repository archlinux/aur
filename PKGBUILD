# Maintainer: h44z <christoph [at] from [doT] tirol>
# Contributor: eolianoe <eolianoe [at] gmail [DoT] com>
# Contributor: localizator <localizator@ukr.net>
# Contributor: Edvinas Valatka <edacval@gmail.com>

pkgname=seafile-client-git
pkgver=7.0.1
pkgrel=1
pkgdesc="GUI client for synchronizing your local files with seafile server, latest version."
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="https://github.com/haiwen/seafile-client"
license=('Apache')
depends=("seafile-git" "qt5-tools" "qt5-webkit" "qt5-base"
         "gtk-update-icon-cache" "qt5-webengine")
makedepends=("cmake")
conflicts=('seafile-client-qt5')
provides=('seafile-client-qt5-git')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('137cc5dea7fc6797bbdf8f340665ac6fa69924f01621244dcbd60e2aba2f14ed')

prepare() {
  cd "${srcdir}"

  rm -rf build
  mkdir -p build
}

build () {
  cd "$srcdir/build"

  cmake \
    -DBUILD_SHIBBOLETH_SUPPORT=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${srcdir}/seafile-client-${pkgver}"

  make
}

package () {
  cd "${srcdir}/build"

  make DESTDIR="${pkgdir}" install
}
