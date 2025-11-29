pkgname=mathematica-documentation-zh-cn
pkgver=14.3.0
pkgrel=1
pkgdesc="Mathematica Documentation (zh-cn)"
url="http://www.wolfram.com/mathematica/"
license=("proprietary")
arch=('any')
depends=('mathematica-light')
source=("local://WLDocs_${pkgver}_LIN_Chinese.sh")
sha256sums=('2b45a44860c0c45bc7892c28d1e7de675cac41f6533c687c7f30623d1634522c')

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
