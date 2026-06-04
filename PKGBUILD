# Maintainer: Yahya Toubali <me@yahyatoubali.me>

pkgname=trae-bin
pkgver=2.3.33256
pkgrel=1
pkgdesc="AI-powered IDE by ByteDance - The Real AI Engine for code development"
arch=('x86_64' 'aarch64')
url="https://trae.ai"
license=('MIT')
depends=('gtk3' 'libxss' 'nss' 'alsa-lib' 'libxtst' 'libdrm' 'mesa' 'libxkbcommon' 'xcb-util-keysyms' 'libxcrypt-compat')
optdepends=('vulkan-icd-loader: Vulkan support')
provides=('trae')
conflicts=('trae')
install=trae-bin.install

source_x86_64=("Trae-linux-x64.deb::https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.33256/linux/Trae-linux-x64.deb")
source_aarch64=("Trae-linux-arm64.deb::https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.33256/linux/Trae-linux-arm64.deb")

sha256sums_x86_64=('d76198b99458a224b285de018f906077acdae9f68899db457a91348fb69983a3')
sha256sums_aarch64=('ffc8318b9d78e42cc4d1262e3be33f1dee2a5a85b8f812a879c4dd4b88a2de3a')

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