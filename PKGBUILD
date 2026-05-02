# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: rany <rany 2 at riseup dot net>

_npmname=surge

pkgname=surge.sh
pkgver=0.27.3
pkgrel=1
pkgdesc="Publish web apps to a CDN with a single command and no setup required."

arch=(any)
url="https://surge.sh/"
depends=('nodejs')
makedepends=('npm')
license=('ISC')
options=('!debug')
source=("${_npmname}-${pkgver}.tgz::https://registry.npmjs.org/${_npmname}/-/${_npmname}-${pkgver}.tgz"
        "LICENSE")
noextract=("${_npmname}-${pkgver}.tgz")
sha256sums=('71430d04a980eb61a1c866256f5a2c2a40c2c44d43efef4c08c5b0e5e76327c4'
            '02d2eebbd299491b3cc3c6c9186bf2fb325eabc712cfc42e3ae64d99e798cbc9')

latestver() {
    npm view "${_npmname}" version
}

package() {
    npm install -g --prefix "${pkgdir}/usr" \
        --omit=dev --ignore-scripts \
        "${srcdir}/${_npmname}-${pkgver}.tgz"

    # Fix file ownership and permissions
    chown -R 0:0 "${pkgdir}/usr"
    find "${pkgdir}/usr" -perm -o+w,g+w -exec chmod o-w,g-w {} +
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
