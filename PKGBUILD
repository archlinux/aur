# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=x3dna
_pkgver=2.3
pkgver=${_pkgver}_20161116
pkgrel=1
pkgdesc="3DNA is a versatile, integrated software system for the analysis, rebuilding and visualization of three-dimensional nucleic-acid-containing structures. Please see: http://forum.x3dna.org/site-announcements/download-instructions/"
arch=('x86_64')
url="http://x3dna.org/"
license=('custom')
depends=('ruby')
source=("http://x3dna.bio.columbia.edu/downloads/v${_pkgver}/${pkgname}-v${_pkgver}-linux-64bit.tar.gz")
md5sums=('0f517e695655374e37159752fc9f008e')

package() {
    cd ${pkgname}-v${_pkgver}/
    install -d ${pkgdir}/etc/profile.d/
    install -d ${pkgdir}/opt/${pkgname}-v${_pkgver}/
    install -d ${pkgdir}/usr/bin/

    # fix conflict with hunspell package
    mv bin/analyze bin/analyze-x3dna

    install bin/* ${pkgdir}/usr/bin/
    cp -R config doc examples fiber lib np_recipes perl_scripts src ${pkgdir}/opt/${pkgname}-v${_pkgver}/
    echo "export X3DNA=/opt/${pkgname}-v${_pkgver}" > "$pkgdir/etc/profile.d/x3dna.sh"
}
