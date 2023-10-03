# Maintainer: Luis Gustavo S. Barreto <gustavosbarreto@gmail.com>
pkgname=docker-desktop
pkgver=4.24.0
pkgrel=1
pkgdesc="Docker Desktop is an easy-to-install application that enables you to locally build and share containerized applications and microservices."
arch=('x86_64')
url="https://www.docker.com/products/docker-desktop/"
license=('custom: Docker Agreement')
depends=('docker>=24.0.6' 'curl' 'qemu>=8.0.4' 'libseccomp' 'libcap-ng' 'pass' 'desktop-file-utils' 'gtk3' 'libx11' 'shadow')
makedepends=('w3m')
install='docker-desktop.install'
source=("https://desktop.docker.com/linux/main/amd64/$pkgname-$pkgver-x86_64.pkg.tar.zst")
md5sums=('14588993bb9faef7418330fe2c78b2bc')

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/lib/systemd/user"
    install -d "${pkgdir}/usr/lib/docker/cli-plugins"
    install -m644 "${srcdir}/usr/lib/systemd/user/docker-desktop.service" "${pkgdir}/usr/lib/systemd/user/docker-desktop.service"
    install -m755 "${srcdir}/usr/lib/docker/cli-plugins/docker-extension" "${pkgdir}/usr/lib/docker/cli-plugins/docker-extension"
    install -m755 "${srcdir}/usr/bin/docker-credential-desktop" "${pkgdir}/usr/bin/docker-credential-desktop"
    cp -r "${srcdir}/opt" "${pkgdir}"
    cp "${srcdir}/usr/share/applications/"* "${pkgdir}/usr/share/applications/"

    # License (thanks @FabioLolix)
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    w3m -dump https://www.docker.com/legal/docker-subscription-service-agreement/ \
        > "$pkgdir/usr/share/licenses/$pkgname/docker-agreement.txt"
}
