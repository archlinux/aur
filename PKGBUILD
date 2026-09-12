# Maintainer: szdytom <szdytom@qq.com>
# Maintainer: k0kubun <takashikkbn@gmail.com>
pkgname=xremap-gnome-bin
pkgdesc='Dynamic key remapper for X11 and Wayland (Gnome Wayland Version)'
pkgver=0.15.13
pkgrel=1

provides=('xremap')
license=('MIT')
url='https://github.com/k0kubun/xremap'
arch=('x86_64' 'aarch64')

source=("LICENSE")
sha256sums=("60365594c733128ba50f05de00c4a6f07fed0a6e8bbd93817f39ded3980f7343")

source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-gnome.zip")
sha256sums_x86_64=('a2be5f98942cb64cff4dacc5da555e61a59758416370b91707a5bd5f106e5651')

source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-aarch64-gnome.zip")
sha256sums_aarch64=('ef4474e5a9abddac431aadf6d377599151628b3226fc274658201d013e9381cd')

package() {
	cd "$srcdir/"
	./xremap --completions zsh > zsh_completions
	./xremap --completions fish > fish_completions
	./xremap --completions bash > bash_completions
	install -Dm644 zsh_completions "${pkgdir}/usr/share/zsh/site-functions/_xremap"
	install -Dm644 fish_completions "${pkgdir}/usr/share/fish/vendor_completions.d/xremap.fish"
	install -Dm644 bash_completions "${pkgdir}/usr/share/bash-completion/completions/xremap"
	install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
