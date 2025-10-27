# Maintainer: Fergal Moran <fergal.moran@gmail.com>
pkgname=xtreamium-proxy
pkgver=1.4.22
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
    # Install binary to /usr/bin
    install -Dm755 "${srcdir}/xtreamium-proxy" "${pkgdir}/usr/bin/xtreamium-proxy"
    
    # Install user systemd service (not system service)
    install -Dm644 "${srcdir}/xtreamium-proxy-user.service" "${pkgdir}/usr/lib/systemd/user/xtreamium-proxy.service"
    
    # Install default configuration template to /usr/share
    install -Dm644 "${srcdir}/appsettings.json" "${pkgdir}/usr/share/xtreamium-proxy/appsettings.json"
    
    # Install documentation
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

