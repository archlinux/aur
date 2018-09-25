# Maintainer: Dmitri Goutnik <dg@syrec.org>

pkgname=pgcenter
pkgver=0.4.0
pkgrel=1
pkgdesc='top-like admin tool for PostgreSQL'
arch=('x86_64')
url='https://github.com/lesovsky/pgcenter'
license=('custom:BSD3')
depends=('postgresql-libs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        'pgcenter.patch')
sha256sums=('325cf9b4e8ee36c6f48f05309c7bcef509f2c4b0bfb1d3b80fa1a9a01b573b16'
            'f11df193e1d488a0368ae6e6aefbcf714805c1a040828e80a6467569b716d79d')

prepare() {
    cd ${pkgname}-${pkgver}
    patch -Np1 -i "${srcdir}/pgcenter.patch"
}

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
