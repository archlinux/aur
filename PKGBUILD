# Maintainer: Jake Merdich <jake@merdich.com>
pkgname=fmpp
pkgver=0.9.15
pkgrel=1
pkgdesc="FreeMarker PreProcessor"
arch=('any')
url="http://fmpp.sourceforge.net/"
license=("Apache")
depends=("java-runtime" "bash")
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}_${pkgver}.tar.gz"
        "fix_opt.patch")
sha256sums=("b893451b5450a7f35fe680e934f6903ec8143d88959dcfca5d17467fbe4142f9"
            "8bc9ddb2984d4c75847dea66872b5f322f6f5aabcc3cbb881e796ec3d071936d")

prepare() {
    patch "${srcdir}"/"${pkgname}/bin/fmpp" "${srcdir}/fix_opt.patch"

}

package() {
    cd "${srcdir}"/"${pkgname}"
    install -D bin/fmpp "$pkgdir"/usr/bin/fmpp

    for lib_file in lib/*.jar; do
        install -D -m644 "${lib_file}" "${pkgdir}/opt/${pkgname}/${lib_file}"
    done

    for lic_file in LICENSE*; do
        install -D -m644 "${lic_file}" "${pkgdir}/usr/share/licenses/${pkgname}/${lic_file}"
    done
}
