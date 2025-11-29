pkgname=mathematica-documentation-en
pkgver=14.3.0
pkgrel=1
pkgdesc="Mathematica Documentation (en)"
url="http://www.wolfram.com/mathematica/"
license=("proprietary")
arch=('any')
depends=('mathematica-light')
source=("local://WLDocs_${pkgver}_LIN.sh")
sha256sums=('863eb6d347d7f00f644f6adb46fa1044ebc9815383da6236569bb61fb2297848')

prepare() {
    warning "Building Mathematica Documentation (en) takes around 10GiB of space for 'makepkg'."
    warning 'Building in a tmpfs (e.g. /tmp when mounted into RAM) may not work.'
}

package() {
    sh ${srcdir}/WLDocs_${pkgver}_LIN.sh -- \
            -execdir=${pkgdir}/usr/bin \
            -targetdir=${pkgdir}/opt/Mathematica_doc_en \
            -auto

    mkdir -p ${pkgdir}/opt/Mathematica
    mv ${pkgdir}/opt/Mathematica_doc_en/Documentation ${pkgdir}/opt/Mathematica/
    rm -rf ${pkgdir}/opt/Mathematica_doc_en
}
