# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>
pkgname=pglogical2
_pkgbase="${pkgname%2}"
pkgver=2.4.1
pkgrel=1
pkgdesc="Logical replication for PostgreSQL"
arch=('i686' 'x86_64')
url="https://2ndquadrant.com/en/resources/pglogical/"
license=('custom:PostgreSQL')
depends=('postgresql')
provides=("${_pkgbase}=${pkgver}")
source=("${_pkgbase}-${pkgver}.tar.xz::https://github.com/2ndQuadrant/${_pkgbase}/archive/REL${pkgver//\./_}.tar.gz")
sha512sums=('0d673e1a2b696e2cfbb94d8350bb15c280947f69b6512aa80f8ef7497e30cbd407a01b9a4f8fa9844b4ccb39377a6b2bee390a7887f3050074c2e6a11e6f3e3f')

build() {
    cd "${srcdir}/${_pkgbase}-REL${pkgver//\./_}"
    make USE_PGXS=1
}

package() {
    cd "${srcdir}/${_pkgbase}-REL${pkgver//\./_}"
    make DESTDIR="${pkgdir}" USE_PGXS=1 install
    install -D -m644 /usr/share/licenses/postgresql/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
