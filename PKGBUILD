# Maintainer: Thore Bödecker <me [at] foxxx0 [dot] de>
pkgname=pglogical2
_pkgbase="${pkgname%2}"
pkgver=2.0.0
pkgrel=1
pkgdesc="Logical replication for PostgreSQL"
arch=('i686' 'x86_64')
url="https://2ndquadrant.com/en/resources/pglogical/"
license=('custom:PostgreSQL')
depends=('postgresql')
provides=("${_pkgbase}=${pkgver}")
source=("${_pkgbase}-${pkgver}.tar.xz::https://github.com/2ndQuadrant/${_pkgbase}/archive/REL${pkgver//\./_}.tar.gz")
sha512sums=('b5651cd402f0c3b453811cbade09d2b3ec1f30b4da05b0282f87481bda3e0618163e539128f8f6755c7eaff669f8f43a9e3e55dfe9323f7579d88e437a60be20')

build() {
    cd "${srcdir}/${_pkgbase}-REL${pkgver//\./_}"
    make USE_PGXS=1
}

package() {
    cd "${srcdir}/${_pkgbase}-REL${pkgver//\./_}"
    make DESTDIR="${pkgdir}" USE_PGXS=1 install
    install -D -m644 /usr/share/licenses/postgresql/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
