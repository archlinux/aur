# Maintainer: desbma
# shellcheck disable=SC2034,SC2148,SC2154,SC2164
pkgname=gmsl
pkgver=1.2.3
pkgrel=2
pkgdesc='GNU Make Standard Library: extra functions to extend functionality of Makefiles'
arch=('any')
url="https://${pkgname}.jgc.org/"
license=('BSD')
depends=('make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jgrahamc/${pkgname}/archive/v${pkgver}.tar.gz"
        'LICENSE'
        'fix-issue5.patch')
sha512sums=('65df5854eb26a8edc0baba56fac06b8cb23a16ff1106ae1626657fc62a831edd87a4afa563942686d26a9e3128e1bdc73582da5a1dc0590385a902bb08d6cf06'
            '3293b312b6fb76f7c963bfeaa972227bd7a0b8a861e92d472b608b956dd1bd57c0e6039ad3e461d0bf2613d00b13c63ce4093db5a56fed1a54f22cde57207394'
            '092bd6daaadcd42de6b5f4cfd351792225d72b67667983cd68dab0371091af994339af4b58aa1b04aa7035c719688f1ecc5754b8deb7254ac20ed095c7514960')

prepare() {
    cd "${pkgname}-${pkgver}"
    # see https://github.com/jgrahamc/gmsl/issues/5 and
    # https://github.com/jgrahamc/gmsl/blob/v1.2.3/__gmsl#L78-L85
    # patch out the test, Arch has a recent make so this has no impact
    patch -i "${srcdir}/fix-issue5.patch"
}

check() {
    cd "${pkgname}-${pkgver}"
    make test
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 644 -t "${pkgdir}/usr/include" gmsl __gmsl
    install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" index.html README changelog.md
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
}
