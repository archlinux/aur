# Maintainer: Es00bac <es00bac@example.com>
pkgname=venus-pro-linux
pkgver=0.2.1
pkgrel=1
pkgdesc="Configuration utility for UtechSmart Venus Pro MMO Mouse (Linux)"
arch=('any')
url="https://github.com/Es00bac/UtechSmart-Venus-Pro-Linux-MMO-Mouse-Utility"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-hidapi' 'hidapi')
makedepends=('git')
source=("git+https://github.com/Es00bac/UtechSmart-Venus-Pro-Linux-MMO-Mouse-Utility.git#tag=v${pkgver}")
md5sums=('SKIP')

package() {
    cd "UtechSmart-Venus-Pro-Linux-MMO-Mouse-Utility"
    
    # 1. Install Libs/Assets to /opt/venusprolinux
    install -d "${pkgdir}/opt/${pkgname}"
    install -m644 venus_gui.py venus_protocol.py staging_manager.py transaction_controller.py mouseimg.png icon.png "${pkgdir}/opt/${pkgname}/"
    
    # 2. Launcher Script
    install -d "${pkgdir}/usr/bin"
    echo "#!/bin/sh" > "${pkgdir}/usr/bin/venusprolinux"
    echo "exec python3 /opt/${pkgname}/venus_gui.py \"\$@\"" >> "${pkgdir}/usr/bin/venusprolinux"
    chmod 755 "${pkgdir}/usr/bin/venusprolinux"
    
    # 3. Desktop File
    install -d "${pkgdir}/usr/share/applications"
    install -m644 packaging/linux/venusprolinux.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    
    # 4. Icon
    install -d "${pkgdir}/usr/share/pixmaps"
    install -m644 icon.png "${pkgdir}/usr/share/pixmaps/venusprolinux.png"
    
    # 5. Udev Rules (Important!)
    # Assuming user provides them or we include one?
    # install -d "${pkgdir}/usr/lib/udev/rules.d"
    # install -m644 99-venus.rules "${pkgdir}/usr/lib/udev/rules.d/"
}
