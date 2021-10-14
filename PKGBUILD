# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Thomas Roos (Roosted7) <mail [at] thomasroos [dot] nl>

pkgname=aliza
pkgver=2.2.0
pkgrel=2
pkgdesc="Medical Imaging. Open 2D, 3D and 4D images in DICOM, MetaIO, Nifti, Nrrd and other formats, incl. THIS PACKAGE REQUIRES PAID LICENSE!"
arch=('x86_64')
url="http://www.aliza-dicom-viewer.com"
license=('custom')
depends=('hicolor-icon-theme'
         'libxt'
         'libglvnd')
options=('!emptydirs')
source=("https://www.aliza-medical-imaging.de/aliza-${pkgver}.tar.gz"
        "aliza.desktop")
sha512sums=('99e3455764d93557b019440424ebf9476f22d5ffb00cb3ff50aaba466c46300fc520192ea3272fb0a374552e4b083a2f384b7bf761a61982f348a158f8240ddd'
            'b17f64ef917e3a85fa846f57285de427a9b61baaba204172a617b6b7ef0c6a7e2c242628b80356df8245603720e95331f7de048b097acc4d09e08ece304a36a3')

package() {
    ALIZA_DIR="/opt/aliza"
    ALIZA_C_DIR="${pkgdir}${ALIZA_DIR}/install_menu"
    ALIZA_I_DIR="${pkgdir}/usr/share/icons/hicolor"

    find "${pkgdir}" -type d -exec chmod 750 {} \;
    
    mkdir -p "${pkgdir}${ALIZA_DIR}"
    cp -r "${pkgname}-${pkgver}"/* "${pkgdir}${ALIZA_DIR}"

    #tar xzf "${pkgname}-${pkgver}.tar.gz" -C "${pkgdir}${ALIZA_DIR}" --strip 1 --owner root --group root
    #install -d 

    for i in 16 22 24 32 36 42 48 64 72 96 128 192 256
    do
      install -Dm644 "${ALIZA_C_DIR}/icons/hicolor/${i}x${i}/apps/aliza.png" "${ALIZA_I_DIR}/${i}x${i}/apps/aliza.png"
    done
    install -Dm644 "${ALIZA_C_DIR}/icons/hicolor/scalable/apps/aliza.svg" "${ALIZA_I_DIR}/scalable/apps/aliza.svg"

    install -Dm644 "${srcdir}/aliza.desktop" "${pkgdir}/usr/share/applications/aliza.desktop"
}
