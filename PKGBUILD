# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Sebastian Lau <lauseb644@gmail.com>

pkgname=nemo-repairer
pkgver=5.6.0
pkgrel=1
pkgdesc="Nemo extension for filename encoding repair"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
groups=('nemo-extensions')
depends=('nemo>=3.2')
makedepends=('intltool' 'meson' 'samurai')
replaces=('nemo-filename-repairer')
source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('6c334b320541672b1c6ac8ec2ffade5a0eb413549fa680ccce56914055f537f0')


build() {
  mkdir -p "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"/builddir
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"/builddir
  meson --prefix=/usr \
        --libexecdir=lib/${pkgname} \
        --buildtype=plain \
        ..
  samu
}

package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"/builddir
  DESTDIR="${pkgdir}" samu install
}
