# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=x3dna
_pkgver=2.3
pkgver=${_pkgver}_2016apr02
pkgrel=1
pkgdesc="3DNA is a versatile, integrated software system for the analysis, rebuilding and visualization of three-dimensional nucleic-acid-containing structures. Please see: http://forum.x3dna.org/site-announcements/download-instructions/"
arch=('i686' 'x86_64')
url="http://x3dna.org/"
license=('custom')
depends=('ruby')
source_i686=("http://x3dna.bio.columbia.edu/downloads/v${_pkgver}/${pkgname}-v${_pkgver}-linux-32bit.tar.gz")
md5sums_i686=('71874b399db7a24f5025b654493d77e2')
source_x86_64=("http://x3dna.bio.columbia.edu/downloads/v${_pkgver}/${pkgname}-v${_pkgver}-linux-64bit.tar.gz")
md5sums_x86_64=('cc65b97a27d38d7a97cb86aaa6e6d152')

package() {
    cd ${pkgname}-v${_pkgver}/
    install -d ${pkgdir}/etc/profile.d/
    install -d ${pkgdir}/opt/${pkgname}-v${_pkgver}/
    install -d ${pkgdir}/usr/bin/

    # fix conflict with hunspell package
    mv bin/analyze bin/analyze-x3dna

    install bin/* ${pkgdir}/usr/bin/
    cp -R config doc examples fiber lib np_recipes perl_scripts ${pkgdir}/opt/${pkgname}-v${_pkgver}/
    echo "export X3DNA=/opt/${pkgname}-v${_pkgver}" > "$pkgdir/etc/profile.d/x3dna.sh"
}
