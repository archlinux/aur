pkgname=mathematica-documentation-zh-cn
pkgver=14.2.0
pkgrel=1
pkgdesc="Mathematica Documentation (zh-cn)"
url="http://www.wolfram.com/mathematica/"
license=("proprietary")
arch=('any')
depends=('mathematica-light')
source=("local://WLDocs_${pkgver}_LIN_Chinese.sh")
sha256sums=('1cd2ea4ff9201804771d0725448bfbdb90d6d2b1db016c188db213cdc8a6fbbc')

prepare() {
    warning "Building Mathematica Documentation (zh-cn) takes around 10GiB of space for 'makepkg'."
    warning 'Building in a tmpfs (e.g. /tmp when mounted into RAM) may not work.'
}

package() {
    sh ${srcdir}/WLDocs_${pkgver}_LIN_Chinese.sh -- \
            -execdir=${pkgdir}/usr/bin \
            -targetdir=${pkgdir}/opt/Mathematica_doc_zh_cn \
            -auto

    mkdir -p ${pkgdir}/opt/Mathematica
    mv ${pkgdir}/opt/Mathematica_doc_zh_cn/Documentation ${pkgdir}/opt/Mathematica/
    rm -rf ${pkgdir}/opt/Mathematica_doc_zh_cn
}
