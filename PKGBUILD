# Maintainer: YalvacRamazan <YalvacRamazan@github.com>
pkgname=petbottle-bin
pkgver=0.1.15
pkgrel=1
pkgdesc="Yerel not uygulamasi"
arch=('x86_64')
url="https://github.com/YalvacRamazan/Petbottle-public"
license=('Apache-2.0')
provides=('petbottle')
conflicts=('petbottle')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3')
source=("${pkgname}-${pkgver}.deb::https://github.com/YalvacRamazan/Petbottle-public/releases/download/v${pkgver}/petbottle_${pkgver}_amd64.deb")
sha256sums=('b22d750dcf88872706d0f88db4dbf58c674504afbb20f1f512cc98b42e319473')

package() {
    
    bsdtar -xf data.tar.* -C "${pkgdir}"
  
    mv "${pkgdir}/usr/bin/petbottle" "${pkgdir}/usr/bin/petbottle-bin"
    
    echo '#!/bin/sh' > "${pkgdir}/usr/bin/petbottle"
    echo 'export WEBKIT_DISABLE_DMABUF_RENDERER=1' >> "${pkgdir}/usr/bin/petbottle"
    echo 'exec /usr/bin/petbottle-bin "$@"' >> "${pkgdir}/usr/bin/petbottle"
    
    
    chmod 755 "${pkgdir}/usr/bin/petbottle"
    chmod 755 "${pkgdir}/usr/bin/petbottle-bin"
}
