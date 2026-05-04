# Maintainer: Yahya Toubali <me@yahyatoubali.me>

pkgname=trae-bin
pkgver=2.3.21083
pkgrel=1
pkgdesc="AI-powered IDE by ByteDance - The Real AI Engine for code development"
arch=('x86_64' 'aarch64')
url="https://trae.ai"
license=('MIT')
depends=('gtk3' 'libxss' 'nss' 'alsa-lib' 'libxtst' 'libdrm' 'mesa' 'libxkbcommon' 'xcb-util-keysyms' 'libxcrypt-compat')
optdepends=('libvulkan: Vulkan support')
provides=('trae')
conflicts=('trae')
install=trae-bin.install

source_x86_64=("Trae-linux-x64.deb::https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.21083/linux/Trae-linux-x64.deb")
source_aarch64=("Trae-linux-arm64.deb::https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.21083/linux/Trae-linux-arm64.deb")

sha256sums_x86_64=('9ffde5baabfbd61b017bdfcb015a016dc7677670a7e51062c5e314180f85634b')
sha256sums_aarch64=('4b124ddb813e9194ea7fb4a96c6731eb973130e9ca9358214bf29e1cde1ca965')

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