# Maintainer: Fergal Moran <fergal.moran@gmail.com>
pkgname=xtreamium-proxy
pkgver=1.4.38
pkgrel=1
pkgdesc="Xtreamium Proxy Service - runs as user service"
arch=('x86_64')
url="https://github.com/xtreamium/xtreamium-proxy"
license=('MIT')
depends=('glibc' 'icu')
provides=('xtreamium-proxy')
conflicts=('xtreamium-proxy')
install=xtreamium-proxy.install
source=("xtreamium-proxy-${pkgver}.tar.gz::https://github.com/xtreamium/xtreamium-proxy/releases/download/v${pkgver}/xtreamium-proxy-linux.tar.gz")
sha256sums=('SKIP')
options=('!strip')

package() {
    # Install all application files to /usr/share (will be copied to user directory on install)
    install -dm755 "${pkgdir}/usr/share/xtreamium-proxy/app"
    
    # Copy all files from the tarball to the app directory
    cp -r "${srcdir}"/* "${pkgdir}/usr/share/xtreamium-proxy/app/"
    
    # Make the binary executable
    chmod +x "${pkgdir}/usr/share/xtreamium-proxy/app/xtreamium-proxy"
    
    # Install user systemd service (modified to use ~/.local/opt)
    install -Dm644 "${srcdir}/xtreamium-proxy-user.service" "${pkgdir}/usr/lib/systemd/user/xtreamium-proxy.service"
    
    # Install documentation
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

