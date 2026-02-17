# Maintainer: Rve27 <rve27github@gmail.com>
pkgname=rvkernel-manager-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Linux Kernel Manager with Material 3 Expressive Design"
arch=('x86_64')
url="https://github.com/Rve27/RvKernel-Manager-Linux"
license=('GPL3')
provides=('rvkernel-manager')
conflicts=('rvkernel-manager')
depends=('glibc' 'bash' 'sudo' 'systemd' 'pciutils' 'hicolor-icon-theme')
options=('!strip')

source=(
    "rvkernel-manager_${pkgver}_amd64.deb::https://github.com/Rve27/RvKernel-Manager-Linux/releases/download/${pkgver}/rvkernel-manager_${pkgver}_amd64.deb"
    "rvkernel-manager-LICENSE::https://raw.githubusercontent.com/Rve27/RvKernel-Manager-Linux/main/LICENSE"
)

sha256sums=('af288196fbfcd664db3caa2c3cc4a63682023dfcc0a56b3dd7327fd3193b8f32'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
    tar -xf data.tar.xz -C "${pkgdir}"

    chmod 755 "${pkgdir}/opt/rvkernel-manager/bin/rvkernel-manager"
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/rvkernel-manager/bin/rvkernel-manager" "${pkgdir}/usr/bin/rvkernel-manager"

    install -Dm644 "${pkgdir}/opt/rvkernel-manager/lib/rvkernel-manager.png" "${pkgdir}/usr/share/pixmaps/rvkernel-manager.png"

    install -Dm644 rvkernel-manager-LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/rvkernel-manager.desktop" <<EOF
[Desktop Entry]
Version=1.0.0
Type=Application
Name=RvKernel Manager
Comment=Linux Kernel Manager with Material 3 Expressive Design
Exec=/usr/bin/rvkernel-manager
Icon=rvkernel-manager
Terminal=false
Categories=System;Tools;Utility;
StartupWMClass=com-rve-rvkernelmanager-MainKt
EOF
}
