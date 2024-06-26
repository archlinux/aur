# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Sebastian Lau <lauseb644@gmail.com>

pkgname=nemo-repairer
pkgver=6.2.0
pkgrel=1
pkgdesc="Nemo extension for filename encoding repair"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
groups=('nemo-extensions')
depends=('nemo')
makedepends=('intltool' 'meson' 'samurai' 'glib2-devel')
replaces=('nemo-filename-repairer')
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('b1c7e3d269ed05f472c80c16cf3f12827cbb48cb05406b276be14060225dbbc3')


build() {
  mkdir -p "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"/builddir
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"/builddir
  meson setup --prefix=/usr \
        --libexecdir=lib/${pkgname} \
        --buildtype=plain \
        ..
  samu
}

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"/builddir
  DESTDIR="${pkgdir}" samu install
}
