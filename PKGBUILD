# Maintainer: David Haller <davidhaller@mailbox.org>

pkgname=apache-drill
pkgver=1.17.0
pkgrel=1
pkgdesc="Schema-free SQL Query Engine for Hadoop, NoSQL and Cloud Storage"
arch=(any)
url="https://drill.apache.org"
license=('Apache')
depends=('java-runtime')
source=("https://www-eu.apache.org/dist/drill/drill-${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "drill-sqlline.sh")
sha256sums=('a3d2d544bcc32b915fb53fced0f982670bd6fe2abd764423e566a5f6b54debf1'
            'cb8fad4535629658654f083c1c323feb4a92b19ed0c4cce2411e23f6910456d3')

package()
{
    cd "${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"

    cp -r -t "${pkgdir}/opt/${pkgname}/" "bin/" "conf/" "jars/" "sample-data/" "KEYS" "LICENSE" "NOTICE" "README.md"
    rm -f "${pkgdir}/opt/${pkgname}/bin/sqlline.bat"
    chmod o+r "${pkgdir}/opt/${pkgname}/conf"/*

    cp "${srcdir}/drill-sqlline.sh" "${pkgdir}/usr/bin/drill-sqlline"
    chmod 755 "${pkgdir}/usr/bin/drill-sqlline"
}
