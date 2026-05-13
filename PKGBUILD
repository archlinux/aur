# Maintainer: Yahya Toubali <me@yahyatoubali.me>

pkgname=trae-bin
pkgver=2.3.24300
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

source_x86_64=("Trae-linux-x64.deb::https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.24300/linux/Trae-linux-x64.deb")
source_aarch64=("Trae-linux-arm64.deb::https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.24300/linux/Trae-linux-arm64.deb")

sha256sums_x86_64=('0ed26de38c6d86d3ba4c6904c21262dbc3c924f59d01b32e77f0e98deef32dc6')
sha256sums_aarch64=('6b65cf7b8d879fd2bc546925120f4779025dc78bd196c622300d366caaa5bb7a')

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