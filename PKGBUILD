# Maintainer: Frederick Zhang <frederick888@tsundere.moe>
# Contributor: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="q"
pkgver="1.7.1"
pkgrel="1"
pkgdesc="SQL-like queries on tabular text data, including joins and subqueries"
url="https://github.com/harelba/q"
license=('GPL3')
arch=('any')
depends=('python2')
changelog="ChangeLog"
source=("https://github.com/harelba/${pkgname}/archive/${pkgver}.tar.gz"
        "https://github.com/harelba/packages-for-q/raw/master/rpms/q-text-as-data-${pkgver}-1.noarch.rpm")
sha1sums=('ca26b3077b310d547080ba544ffba8a8bcbde7f9'
          'ae4e4fb508676f60a3ba44171a62cd83ddfb2f2f')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    # Replace shell bang with python2. Not compatible with python3 yet.
    sed -e '0,/python/{s/python/python2/}' -i "bin/${pkgname}"
}

package() {
    cd "${srcdir}/"

    install -D -m755 "${pkgname}-${pkgver}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -D -m755 "usr/share/man/man1/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}

# vim:set ts=4 sw=4 et:
