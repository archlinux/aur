pkgname=mathematica-documentation-en
pkgver=14.2.0
pkgrel=1
pkgdesc="Mathematica Documentation (en)"
url="http://www.wolfram.com/mathematica/"
license=("proprietary")
arch=('any')
depends=('mathematica-light')
source=("local://WLDocs_${pkgver}_LIN.sh")
sha256sums=('a15bc3103c1af632a054d06faa4f3b7f3d8cab3dc7224670de65fd467c6e0526')

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
