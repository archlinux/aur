# Maintainer: Luis Gustavo S. Barreto <gustavosbarreto@gmail.com>
# Maintainer: Leandro Cunha <leandrocunha016@gmail.com>
# Maintainer: Mark Allen Park <markallenpark@gmail.com>
# Maintainer: Luciano Ciccariello <luciano.ciccariello@docker.com>

pkgname=docker-desktop
pkgver=4.65.0
_revision=221669
pkgrel=1
pkgdesc="Docker Desktop is an easy-to-install application that enables you to locally build and share containerized applications and microservices."
arch=('x86_64')
url="https://www.docker.com/products/docker-desktop/"
license=('custom: Docker Agreement')
depends=('docker>=28.3.0' 'curl>=8.5.0' 'qemu>=8.0.4' 'libseccomp>=2.5.5' 'libcap-ng>=0.8.4' 'pass' 'desktop-file-utils' 'gtk3' 'libx11' 'shadow>=4.14.2')
conflicts=('docker-compose' 'docker-buildx' 'docker-mcp')
provides=('docker-compose' 'docker-buildx' 'docker-mcp')
makedepends=('w3m')
install='docker-desktop.install'
source=("$pkgname-$pkgver-x86_64.tar.zst::https://desktop.docker.com/linux/main/amd64/$_revision/$pkgname-x86_64.pkg.tar.zst")
sha256sums=('fa044499ae897e3c8b093522c0ea0ed5d1cfb6c598ba0b5de62da7c3b1752231')

package() {
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/lib/systemd/user"
    install -d "${pkgdir}/usr/lib/docker/cli-plugins"
    install -m644 "${srcdir}/usr/lib/systemd/user/docker-desktop.service" "${pkgdir}/usr/lib/systemd/user/docker-desktop.service"
    install -m755 "${srcdir}/usr/lib/docker/cli-plugins/docker-agent" "${pkgdir}/usr/lib/docker/cli-plugins/docker-agent"
    install -m755 "${srcdir}/usr/lib/docker/cli-plugins/docker-ai" "${pkgdir}/usr/lib/docker/cli-plugins/docker-ai"
    install -m755 "${srcdir}/usr/lib/docker/cli-plugins/docker-buildx" "${pkgdir}/usr/lib/docker/cli-plugins/docker-buildx"
    install -m755 "${srcdir}/usr/lib/docker/cli-plugins/docker-compose" "${pkgdir}/usr/lib/docker/cli-plugins/docker-compose"
    install -m755 "${srcdir}/usr/lib/docker/cli-plugins/docker-debug" "${pkgdir}/usr/lib/docker/cli-plugins/docker-debug"
    install -m755 "${srcdir}/usr/lib/docker/cli-plugins/docker-desktop" "${pkgdir}/usr/lib/docker/cli-plugins/docker-desktop"
    install -m755 "${srcdir}/usr/lib/docker/cli-plugins/docker-dhi" "${pkgdir}/usr/lib/docker/cli-plugins/docker-dhi"
    install -m755 "${srcdir}/usr/lib/docker/cli-plugins/docker-extension" "${pkgdir}/usr/lib/docker/cli-plugins/docker-extension"
    install -m755 "${srcdir}/usr/lib/docker/cli-plugins/docker-init" "${pkgdir}/usr/lib/docker/cli-plugins/docker-init"
    install -m755 "${srcdir}/usr/lib/docker/cli-plugins/docker-mcp" "${pkgdir}/usr/lib/docker/cli-plugins/docker-mcp"
    install -m755 "${srcdir}/usr/lib/docker/cli-plugins/docker-offload" "${pkgdir}/usr/lib/docker/cli-plugins/docker-offload"
    install -m755 "${srcdir}/usr/lib/docker/cli-plugins/docker-pass" "${pkgdir}/usr/lib/docker/cli-plugins/docker-pass"
    install -m755 "${srcdir}/usr/lib/docker/cli-plugins/docker-sandbox" "${pkgdir}/usr/lib/docker/cli-plugins/docker-sandbox"
    install -m755 "${srcdir}/usr/lib/docker/cli-plugins/docker-sbom" "${pkgdir}/usr/lib/docker/cli-plugins/docker-sbom"
    install -m755 "${srcdir}/usr/lib/docker/cli-plugins/docker-scout" "${pkgdir}/usr/lib/docker/cli-plugins/docker-scout"
    install -m755 "${srcdir}/usr/bin/docker-credential-desktop" "${pkgdir}/usr/bin/docker-credential-desktop"
    cp -r "${srcdir}/opt" "${pkgdir}"
    cp "${srcdir}/usr/share/applications/"* "${pkgdir}/usr/share/applications/"

    # License (thanks @FabioLolix)
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    w3m -dump https://www.docker.com/legal/docker-subscription-service-agreement/ \
        > "$pkgdir/usr/share/licenses/$pkgname/docker-agreement.txt"
}
