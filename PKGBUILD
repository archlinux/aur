# Maintainer: Luis Gustavo S. Barreto <gustavosbarreto@gmail.com>
pkgname=docker-desktop
pkgver=4.21.1
pkgrel=1
pkgdesc="Docker Desktop is an easy-to-install application that enables you to locally build and share containerized applications and microservices."
arch=('x86_64')
url="https://www.docker.com/products/docker-desktop/"
license=('custom: Docker Agreement')
depends=('docker>=23.0.0' 'curl' 'qemu>=5.2.0' 'libseccomp' 'libcap-ng' 'pass' 'desktop-file-utils' 'gtk3' 'libx11' 'shadow')
makedepends=('w3m')
install='docker-desktop.install'
source=("https://desktop.docker.com/linux/main/amd64/$pkgname-$pkgver-x86_64.pkg.tar.zst")
md5sums=('ed56ddccf7a3dc4847a7023b7aa6845c')

package() {
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/lib/systemd/user"
    install -d "${pkgdir}/usr/lib/docker/cli-plugins"
    install -m644 "${srcdir}/usr/lib/systemd/user/docker-desktop.service" "${pkgdir}/usr/lib/systemd/user/docker-desktop.service"
    install -m755 "${srcdir}/usr/lib/docker/cli-plugins/docker-extension" "${pkgdir}/usr/lib/docker/cli-plugins/docker-extension"
    cp -r "${srcdir}/opt" "${pkgdir}"
    cp "${srcdir}/usr/share/applications/"* "${pkgdir}/usr/share/applications/"

    # License (thanks @FabioLolix)
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    w3m -dump https://www.docker.com/legal/docker-subscription-service-agreement/ \
        > "$pkgdir/usr/share/licenses/$pkgname/docker-agreement.txt"
}
