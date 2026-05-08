# Maintainer: Ramazan <YalvacRamazan@github.com>
pkgname=petbottle-bin
pkgver=0.1.15
pkgrel=3
pkgdesc="Yerel not uygulamasi"
arch=('x86_64')
url="https://github.com/YalvacRamazan/Petbottle-public"
license=('Apache-2.0' 'LGPL')
provides=('petbottle')
conflicts=('petbottle')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3')
source=("${pkgname}-${pkgver}.deb::https://github.com/YalvacRamazan/Petbottle-public/releases/download/v${pkgver}/petbottle_${pkgver}_amd64.deb"
        "LICENSE::https://raw.githubusercontent.com/YalvacRamazan/Petbottle-public/main/LICENSE"
        "NOTICE::https://raw.githubusercontent.com/YalvacRamazan/Petbottle-public/main/NOTICE")
sha256sums=('b22d750dcf88872706d0f88db4dbf58c674504afbb20f1f512cc98b42e319473'
            'SKIP'
            'SKIP')

package() {
    
    bsdtar -xf data.tar.* -C "${pkgdir}"
  
    mv "${pkgdir}/usr/bin/petbottle" "${pkgdir}/usr/bin/petbottle-bin"
    
    echo '#!/bin/sh' > "${pkgdir}/usr/bin/petbottle"
    echo 'export WEBKIT_DISABLE_DMABUF_RENDERER=1' >> "${pkgdir}/usr/bin/petbottle"
    echo 'exec /usr/bin/petbottle-bin "$@"' >> "${pkgdir}/usr/bin/petbottle"
    
    
    chmod 755 "${pkgdir}/usr/bin/petbottle"
    chmod 755 "${pkgdir}/usr/bin/petbottle-bin"
    
    # Install license and notice
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}
