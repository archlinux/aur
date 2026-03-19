# Maintainer: Yahya Toubali <your-email@example.com>

pkgname=trae-bin
pkgver=1.107.1
pkgrel=1
pkgdesc="TRAE - The Real AI Engine, an AI-powered IDE"
arch=('x86_64' 'aarch64')
url="https://trae.ai"
license=('MIT')
depends=('gtk3' 'libxss' 'nss' 'alsa-lib' 'libxtst' 'libdrm' 'libgbm' 'libxkbcommon' 'xcb-util-keysyms' 'libxcrypt-compat')
optdepends=('libvulkan: Vulkan support')
provides=('trae')
conflicts=('trae')
install=trae-bin.install

source_x86_64=("Trae-linux-x64.deb::https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.13344/linux/Trae-linux-x64.deb")
source_aarch64=("Trae-linux-arm64.deb::https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.13344/linux/Trae-linux-arm64.deb")

sha256sums_x86_64=('6af50c118c57acdae151419f02bf6090ab509489611803844b50731c93e9ecae')
sha256sums_aarch64=('444d80d65ea01b7dde6c1bc92c377273fd9dc10ec84b2cf474096cdfc1873a64')

prepare() {
	mkdir -p src
	ar -x *.deb
	bsdtar -xf data.tar.xz -C src
}

package() {
	cp -r src/usr "$pkgdir/"
	
	mkdir -p "$pkgdir/usr/bin"
	ln -sf /usr/share/trae/bin/trae "$pkgdir/usr/bin/trae"
	
	if [ -f "$pkgdir/usr/share/trae/resources/app/LICENSE.txt" ]; then
		install -Dm644 "$pkgdir/usr/share/trae/resources/app/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}