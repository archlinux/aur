# Maintainer: Ben Oliver <ben@bfoliver.com>
pkgname=oasis
pkgrel=2
pkgver=2.17.0
pkgdesc="Helps you follow friends and discover new ones on Secure Scuttlebutt (SSB)."
arch=('any')
url='https://github.com/fraction/oasis'
license=('AGPL3')
makedepends=('npm')
noextract=("${pkgname}-${pkgver}.tgz")
source=(https://github.com/fraction/${pkgname}/archive/v${pkgver}.tar.gz
        oasis.install
)
install=oasis.install
md5sums=('25ffb6dbc852c1f2ded2c24ce333c352'
         '530a21b91ca2d7340ede2fd91fc3dbeb')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/v${pkgver}.tar.gz"

    find "${pkgdir}/usr" -type d -exec chmod 755 {} +

    chown -R root:root "${pkgdir}"

    install -Dm644 "${srcdir}"/${pkgname}-${pkgver}/contrib/${pkgname}.service \
    "${pkgdir}"/usr/lib/systemd/user/${pkgname}.service
}
