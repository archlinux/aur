# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: rany <rany 2 at riseup dot net>

_npmname=surge

pkgname=surge.sh
pkgver=0.52.5
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
sha256sums=('cd6bece365bda18bf1f69d1212be6c1af175363a7302438a62596a35f20b817b'
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
