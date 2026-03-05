# Maintainer: Rumata <Rumata01@github.com>
pkgname=petbottle-bin
pkgver=0.1.14
pkgrel=1
pkgdesc="Yerel not uygulamasi"
arch=('x86_64')
url="https://github.com/Rumata01/Petbottle-public"
license=('Apache-2.0')
provides=('petbottle')
conflicts=('petbottle')
depends=('gtk3' 'webkit2gtk' 'libappindicator-gtk3')
source=("${pkgname}-${pkgver}.deb::https://github.com/Rumata01/Petbottle-public/releases/download/v${pkgver}/petbottle_${pkgver}_amd64.deb")
sha256sums=('732bf6946ee5736330af75e37c5041e767e2b1af40a60935cffd0fcd42671e9b')

package() {
    
    bsdtar -xf data.tar.* -C "${pkgdir}"
  
    mv "${pkgdir}/usr/bin/petbottle" "${pkgdir}/usr/bin/petbottle-bin"
    
    echo '#!/bin/sh' > "${pkgdir}/usr/bin/petbottle"
    echo 'export WEBKIT_DISABLE_DMABUF_RENDERER=1' >> "${pkgdir}/usr/bin/petbottle"
    echo 'exec /usr/bin/petbottle-bin "$@"' >> "${pkgdir}/usr/bin/petbottle"
    
    
    chmod 755 "${pkgdir}/usr/bin/petbottle"
    chmod 755 "${pkgdir}/usr/bin/petbottle-bin"
}
