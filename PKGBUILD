pkgname=mcpelauncher-linux-bin
pkgver=1.8.7.40934284323.1~bookworm
pkgrel=3
pkgdesc="Minecraft Bedrock Launcher for Linux"
arch=('x86_64')
url="https://minecraft-linux.github.io"
license=('GPL-3.0-only' 'MIT')
provides=(mcpelauncher-client)
conflicts=(mcpelauncher-linux mcpelauncher-linux-git)
depends=(glibc libgcc libstdc++ openssl qt6-base qt6-declarative qt6-webengine freeglut zlib)
optdepends=('mcpelauncher-ui: GUI for Launcher')

source=("https://minecraft-linux.github.io/pkg/deb/pool/bookworm/main/m/mcpelauncher-manifest/mcpelauncher-manifest_${pkgver}_amd64.deb")
b2sums=('8f850fdb7ed090b92e4c3cdf1776a6731b67da344e5775bbb8b5c8a1faf5d4fc7beacbb25cb232f1b97a8eb36bc9ec0ad35f5fcba33ee54efa6ab15fb672ed70')
noextract=("mcpelauncher-manifest_${pkgver}_amd64.deb")

package() {
    ar vx "${srcdir}/mcpelauncher-manifest_${pkgver}_amd64.deb" data.tar.gz 1>/dev/null
    tar -xzf data.tar.gz -C "${srcdir}"
	mkdir -p "${pkgdir}"/{etc/profile.d,opt/mcpelauncher-bin/{bin,share}}
	cp -r "${srcdir}"/usr/share "${pkgdir}"/opt/mcpelauncher-bin
	install -Dm755 "${srcdir}"/usr/bin/* -t "${pkgdir}"/opt/mcpelauncher-bin/bin/
	echo 'export PATH="$PATH:/opt/mcpelauncher-bin/bin"' > ${pkgdir}/etc/profile.d/mcpelauncher-bin.sh
	chmod 755 ${pkgdir}/etc/profile.d/mcpelauncher-bin.sh
}
