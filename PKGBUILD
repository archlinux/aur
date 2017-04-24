# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="q"
pkgver="1.6.3"
pkgrel="1"
pkgdesc="SQL-like queries on tabular text data, including joins and subqueries"
url="https://github.com/harelba/q"
license=('GPL3')
arch=('any')
depends=('python2')
changelog="ChangeLog"
source=("https://github.com/harelba/${pkgname}/archive/${pkgver}.tar.gz"
        "https://github.com/harelba/packages-for-q/raw/master/rpms/q-text-as-data-${pkgver}-1.noarch.rpm")
sha1sums=('5898c74b52f9270df1310823c9005d8d68c65123'
          '5699f52aac37d4b14016f206d232d33f7a2a4c83')

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
