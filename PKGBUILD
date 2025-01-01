# Maintainer: Kiri <kiri@vern.cc>
# Contributor: wangzhichao <wangzhichao1990@126.com>

pkgname=bio-tbtools
_pkgname=tbtools
pkgver=2.148
pkgrel=1
epoch=1
pkgdesc='GUI/CommandLine Tool Box for biologistists to utilize NGS data. \
	https://doi.org/10.1016/j.molp.2023.09.010'
arch=('x86_64')
url='https://github.com/CJ-Chen/TBtools-II'
license=('unknown')
depends=('java-runtime>=11'
         'bash')
makedepends=('unzip'
             'gendesk')
optdepends=('blast+: BLAST support'
            'diamond: quick blast(needed in quick MCScanx scan) support'
            'mcscanx: collinear scan support'
            'hmmer: HMM Search support'
            'muscle: align support'
            'trimal: large scale align support'
            'iqtree: maximum likelihood phylogenomic tree support'
            'kaks_calculator: kaks calculate support')
source=("https://github.com/CJ-Chen/TBtools-II/releases/download/${pkgver}/TBtools_JRE1.6.jar")
sha256sums=('0b8c8ec94187b6e03754ad72cafe3bff461ac8d1b9d115663c6e57fa8f31f34d')

prepare() {
    # generate /usr/bin file
    printf '#!/usr/bin/sh\nexec java -jar /usr/share/bio-tbtools/tbtools*.jar "$@"\n'>${srcdir}/${_pkgname}
    # generate desk entry
    gendesk -f -n --pkgname "${_pkgname}" --pkgdesc "${pkgdesc}" --exec="${_pkgname}" --name="${_pkgname}" --categories="Science"
}

package() {
    install -Dm 755 ${srcdir}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
    install -Dm 644 ${srcdir}/${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
    install -Dm 755 ${srcdir}/TBtools*.jar ${pkgdir}/usr/share/${pkgname}/${_pkgname}.jar
    install -Dm 644 ${srcdir}/Icons/TBtoolsLogo.png ${pkgdir}/usr/share/icons/hicolor/720x720/apps/${_pkgname}.png
    install -Dm 644 ${srcdir}/Icons/TBtoolsLogo16x16.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/${_pkgname}.png
}
