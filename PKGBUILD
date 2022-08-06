# Maintainer: David Haller <davidhaller@mailbox.org>

pkgname=apache-drill
pkgver=1.20.2
pkgrel=1
pkgdesc="Schema-free SQL Query Engine for Hadoop, NoSQL and Cloud Storage"
arch=(any)
url="https://drill.apache.org"
license=('Apache')
depends=('java-runtime')
source=("https://dlcdn.apache.org/drill/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "drill-embedded")
sha256sums=('2d4c7d85211b214b057d2bd4c081fdcf3c3898e866f7690e3f4a6ab25d1a4bed'
            '017be05204b343c7dd3308370fc607f36934ab201a1b525fc51cff75b96b3a16')

package()
{
    cd "${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"

    cp -r -t "${pkgdir}/opt/${pkgname}/" "bin/" "conf/" "jars/" "sample-data/" "KEYS" "LICENSE" "NOTICE" "README.md" "git.properties"
    rm -f "${pkgdir}/opt/${pkgname}/bin/sqlline.bat"
    chmod o+r "${pkgdir}/opt/${pkgname}/conf"/*

    cp "${srcdir}/drill-embedded" "${pkgdir}/usr/bin/drill-embedded"
    chmod 755 "${pkgdir}/usr/bin/drill-embedded"
}
