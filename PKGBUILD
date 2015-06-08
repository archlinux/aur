# Maintainer: Sergio Conde <skgsergio@gmail.com>
pkgname=bsvc_etsiinf-upm
pkgver=2.1+
pkgrel=2
pkgdesc="Motorola MC68000 simulator precompiled by the Department of Architecture and Technology Information Systems (DATSI) of the School of Computer Engineers (ETSIInf) at the Technical University of Madrid (UPM)."
arch=('i686' 'x86_64')
url='http://www.datsi.fi.upm.es/docencia/Arquitectura_09/Proyecto_E_S/'
license=('custom')
depends=('tk' 'xterm')
source=(
    'http://www.datsi.fi.upm.es/docencia/Arquitectura_09/Proyecto_E_S/bsvc-2.1+_Estatica.tar.gz'
)
sha256sums=(
    '0e6f20b2eaa6cc64ae84cae480f4dc5db7dd797a704e7ce2f99e6c75798523a2'
)

package() {
    # Copy files to pkgdir
    cp -R "${srcdir}"/usr "${pkgdir}"/usr

    # Create links in /usr/local/bin/ for the executable binaries found in /usr/local/bsvc/bin/
    mkdir "${pkgdir}"/usr/local/bin
    for file in "${pkgdir}"/usr/local/bsvc/bin/*; do
        if [ -f ${file} ] && [ -x ${file} ]; then
            ln -s ../bsvc/bin/"$(basename ${file})" "${pkgdir}"/usr/local/bin/"$(basename ${file})"
        fi
    done

    # Reset UI fonts and colors
    echo -n > "${pkgdir}"/usr/local/bsvc/bin/UI/bsvc.ad

    # Install license
    install -Dm644 "${pkgdir}"/usr/local/bsvc/License.doc "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
