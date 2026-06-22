# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
pkgname=owncloud-client-6
pkgver=6.0.3.18040
pkgrel=3
pkgdesc='ownCloud client based on mirall (Legacy 6.x version with support for ownCloud Server)'
arch=(x86_64)
url='http://owncloud.org/'
license=(GPL-2.0-only)
depends=(
    glibc
    kdsingleapplication
    libre-graph-api
    libstdc++
    qt6-base
    qt6-declarative
    qt6-svg
    qtkeychain-qt6
    sqlite
    zlib
)
makedepends=(
    doxygen
    extra-cmake-modules
    python-sphinx
    qt6-tools
)
optdepends=(
    'nemo-python: integration with Nemo'
    'python-caja: integration with Caja'
    'python-nautilus: integration with Nautilus'
)
conflicts=(owncloud-client)
provides=(owncloud-client=$pkgver)
install="${pkgname}.install"
backup=('etc/ownCloud/sync-exclude.lst')
source=(https://download.owncloud.com/desktop/ownCloud/stable/$pkgver/source/ownCloud-$pkgver.tar.xz)
sha256sums=('47ea41430801332b65c9dc067f4d0295c24fe8f0c12265d22849cc94ad13c4d4')
validpgpkeys=(F05F7DD7953A07DF36579DAA498C45EBE94E7B37) # ownCloud Client Team (Signing Key) <info@owncloud.com>

build() {
  cmake -B build -S ownCloud-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_INSTALL_RPATH=ON \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_SYSCONFDIR=/etc
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
