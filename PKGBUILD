# Maintainer: Lev Levitsky <levlev@mail.ru>
pkgname=msgfplus
pkgver=2020.06.22
pkgrel=1
pkgdesc="MS/MS database search tool"
arch=('any')
url="https://github.com/MSGFPlus/msgfplus"
license=('custom')
depends=('java-environment')
makedepends=('maven')
source=("https://github.com/MSGFPlus/msgfplus/archive/v${pkgver}.zip"
		"msgf+"
		"mzid2tsv"
        "scoringParamGen"
        "https://raw.githubusercontent.com/sangtaekim/msgfplus/master/LICENSE.txt")
md5sums=('d1d2a0f19a476c3c6f24a44d735243f7'
         'c43c6581b373266171c3930c3718eb9c'
         'c860b9c30b74dae43de2d3933a405ac1'
         '315d84069d6333a83599aa93b782eb5c'
         '88b22e0922010401ea88bcf03e3bb5d2')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mvn package
}

package() {
    cd "$srcdir"
    install -D "${pkgname}-${pkgver}/target/MSGFPlus.jar" "${pkgdir}/usr/share/java/${pkgname}/MSGFPlus.jar"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp -r "${pkgname}-${pkgver}/docs/examples" "${pkgdir}/usr/share/${pkgname}/"
    install -D msgf+ "${pkgdir}/usr/bin/msgf+"
    install -D mzid2tsv "${pkgdir}/usr/bin/mzid2tsv"
    install -D scoringParamGen "${pkgdir}/usr/bin/scoringParamGen"
    install -D LICENSE.txt -t "${pkgdir}/usr/share/licenses/msgfplus/"
}
