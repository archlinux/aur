# Maintainer: Es00bac <es00bac@example.com>
pkgname=venusprolinux-git
pkgver=0.2.1.r2.gce92f33
pkgrel=1
pkgdesc="Configuration utility for UtechSmart Venus Pro MMO Mouse (Linux) - Git Version"
arch=('any')
url="https://github.com/Es00bac/UtechSmart-Venus-Pro-Linux-MMO-Mouse-Utility"
license=('MIT')
depends=('python' 'python-pyqt6' 'python-hidapi' 'hidapi')
makedepends=('git')
provides=('venus-pro-linux')
conflicts=('venus-pro-linux')
source=("git+https://github.com/Es00bac/UtechSmart-Venus-Pro-Linux-MMO-Mouse-Utility.git")
md5sums=('SKIP')

pkgver() {
    cd "UtechSmart-Venus-Pro-Linux-MMO-Mouse-Utility"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "UtechSmart-Venus-Pro-Linux-MMO-Mouse-Utility"
    
    # 1. Install Libs/Assets to /opt/venusprolinux
    install -d "${pkgdir}/opt/${pkgname%-git}"
    install -m644 venus_gui.py venus_protocol.py staging_manager.py transaction_controller.py mouseimg.png icon.png "${pkgdir}/opt/${pkgname%-git}/"
    
    # 2. Launcher Script
    install -d "${pkgdir}/usr/bin"
    echo "#!/bin/sh" > "${pkgdir}/usr/bin/${pkgname%-git}"
    echo "exec python3 /opt/${pkgname%-git}/venus_gui.py \"\$@\"" >> "${pkgdir}/usr/bin/${pkgname%-git}"
    chmod 755 "${pkgdir}/usr/bin/${pkgname%-git}"
    
    # 3. Desktop File
    install -d "${pkgdir}/usr/share/applications"
    install -m644 packaging/linux/venusprolinux.desktop "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    
    # 4. Icon
    install -d "${pkgdir}/usr/share/pixmaps"
    install -m644 icon.png "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
}
