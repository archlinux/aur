# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=injeqt
pkgver=1.2.0
pkgrel=1
pkgdesc='Dependency injection framework for Qt'
arch=('i686' 'x86_64')
url='https://github.com/vogel/injeqt'
license=('LGPL2.1')
depends=('qt5-base')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"${url}/archive/${pkgver}.tar.gz"
        "gcc7-fix.patch")
sha256sums=('77540cedb0b26affe993dd18124d796059e34c80a51d9ae6433fdff1860db135'
            'c4100ae17234b7d00cb30ea8dd9ab5517eed0f702d0e3e260b3a5b472fe25779')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/gcc7-fix.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DDISABLE_EXAMPLES=ON \
    -DDISABLE_TESTS=ON
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

