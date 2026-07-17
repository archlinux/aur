pkgname=mcpelauncher-linux-bin
pkgver=1.7.6.28199233421.1~bookworm
pkgrel=1
pkgdesc="Minecraft Bedrock Launcher for Linux"
arch=('x86_64')
url="https://minecraft-linux.github.io"
license=('GPL-3.0-only' 'MIT')
provides=(mcpelauncher-client)
conflicts=(mcpelauncher-linux mcpelauncher-linux-git)
depends=(glibc libgcc libstdc++ openssl qt6-base qt6-declarative qt6-webengine freeglut zlib)

source=("https://minecraft-linux.github.io/pkg/deb/pool/bookworm/main/m/mcpelauncher-manifest/mcpelauncher-manifest_${pkgver}_amd64.deb")
b2sums=('SKIP')
noextract=("mcpelauncher-manifest_${pkgver}_amd64.deb")

package() {
        ar vx "${srcdir}/mcpelauncher-manifest_${pkgver}_amd64.deb" data.tar.gz 1>/dev/null
        tar -xzf data.tar.gz -C "${srcdir}"
	mkdir -p "${pkgdir}"/opt/mcpelauncher-bin/{bin,share}
	cp -r "${srcdir}"/usr/share "${pkgdir}"/opt/mcpelauncher-bin
	install -Dm755 "${srcdir}"/usr/bin/* -t "${pkgdir}"/opt/mcpelauncher-bin/bin/
}
