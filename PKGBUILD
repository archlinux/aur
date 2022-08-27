# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=xwinmosaic
pkgver=0.4.2
pkgrel=2
pkgdesc="X11 window switcher with fancy look"
url="http://github.com/soulthreads/xwinmosaic"
arch=('i686' 'x86_64')
license=('BSD')
depends=('libx11' 'gtk2')
makedepends=('cmake')
provides=("${pkgname}")
conflicts=("${pkgname}-git")

source=(${pkgname}-${pkgver}.tar.gz::https://github.com/soulthreads/${pkgname}/archive/v${pkgver}.tar.gz
        'https://github.com/soulthreads/xwinmosaic/pull/33.patch')
sha256sums=('985b8b2f8bfc76173e94186c9d1f8fc746c24e3ed589d0e2fce9ff091c2a5afe'
            '35406f071c65cce79b5370ea98f00713def1b5fe896d5756d886371b7ba440df')

prepare() {
  cd "${pkgname}-${pkgver}"

  patch -p1 < ../33.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  cmake \
    -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_SCRIPTS=ON

  cmake --build build
}

package() {
  cd "${pkgname}-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
