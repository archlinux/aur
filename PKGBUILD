# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
pkgname=rhythmbox-plugin-listenbrainz
pkgver=1.2.5
pkgrel=1
pkgdesc="Rhythmbox plugin to submit your listens to ListenBrainz"
arch=('any')
url="https://github.com/phw/rhythmbox-plugin-listenbrainz"
license=('MIT')
depends=('rhythmbox>=3.0' 'python')
makedepends=('git' 'meson')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/phw/${pkgname}/archive/v${pkgver}.tar.gz)
sha1sums=('0459374f617583bcd31d9d88f2c49d618837e83f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  meson --prefix=/usr builddir
  cd builddir
  ninja
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/builddir"
  DESTDIR=${pkgdir} ninja install
  install -Dvm644 ../LICENSE -t $pkgdir/usr/share/licenses/${pkgname}/
}
