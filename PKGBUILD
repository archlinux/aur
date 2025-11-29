# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Jelle van der Waa <jelle@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Ivy Foster <iff@archlinux.org>

pkgname=physlock
pkgdesc='Lightweight Linux console locking tool'
pkgver=13
pkgrel=5
url='https://github.com/muennich/physlock'
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('pam')
optdepends=('xss-lock: lock screen on suspend or after inactivity')
backup=('etc/pam.d/physlock')
source=("physlock-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "physlock.pam")
b2sums=('a43f151c1660c38bd028f80742637a51d5108e6769161c88fb269ac03c827e49bd20e521b8face6aa6a71a8ab65ddf8662e81e8251b74c13388070ed04d4e13b'
        'f3809a5ce453a00e4cfa445670425e5644e13723fa02539cf823134c2de942f263647eb08cb85867506148ebc6cd333921f93b7c283ff84ae0792c9b3333ec34')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make PREFIX=/usr
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    make PREFIX=/usr "DESTDIR=${pkgdir}" install

    install -D -m 644 "${srcdir}"/physlock.pam "${pkgdir}/etc/pam.d/physlock"
}
