pkgname=mcpelauncher-ui-bin
pkgver=1.7.6.28199233421.1~bookworm
pkgrel=1
pkgdesc="Minecraft Bedrock Launcher for Linux"
arch=('x86_64')
url="https://minecraft-linux.github.io"
license=('GPL-3.0-only' 'MIT')
provides=(mcpelauncher-ui)
conflicts=(mcpelauncher-ui mcpelauncher-ui-git)
depends=(curl glibc hicolor-icon-theme libgcc libstdc++ libzip mcpelauncher-client openssl protobuf3.21 qt6-base qt6-declarative qt6-webchannel qt6-webengine zlib)
makedepends=(imagemagick)

source=("https://minecraft-linux.github.io/pkg/deb/pool/bookworm/main/m/mcpelauncher-ui-manifest/mcpelauncher-ui-manifest_${pkgver}_amd64.deb")
b2sums=('SKIP')
noextract=("mcpelauncher-ui-manifest_${pkgver}_amd64.deb")

package() {
        ar vx "${srcdir}/mcpelauncher-ui-manifest_${pkgver}_amd64.deb" data.tar.gz 1>/dev/null
        tar -xzf data.tar.gz -C "${srcdir}"
	mkdir -p "${pkgdir}"/{usr/share/{applications,icons/hicolor/scalable/apps},opt/mcpelauncher-bin/{bin,share}}
	cp -r "${srcdir}"/usr/share "${pkgdir}"/opt/mcpelauncher-bin
	sed -i 's/libzip.so.4/libzip.so.5/' "${srcdir}"/usr/bin/*	
	install -Dm755 "${srcdir}"/usr/bin/* -t "${pkgdir}"/opt/mcpelauncher-bin/bin/
	cp "${pkgdir}"/opt/mcpelauncher-bin/share/pixmaps/mcpelauncher-ui-qt.svg "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/mcpelauncher-ui-qt.svg
	cp "${pkgdir}"/opt/mcpelauncher-bin/share/applications/mcpelauncher-ui-qt.desktop "${pkgdir}"/usr/share/applications
}
