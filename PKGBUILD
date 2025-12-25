# Maintainer: szdytom <szdytom@qq.com>
# Maintainer: k0kubun <takashikkbn@gmail.com>
pkgname=xremap-gnome-bin
pkgdesc='Dynamic key remapper for X11 and Wayland (Gnome Wayland Version)'
pkgver=0.14.8
pkgrel=1

provides=('xremap')
license=('MIT')
url='https://github.com/k0kubun/xremap'
arch=('x86_64' 'aarch64')

source=("LICENSE")
sha256sums=("60365594c733128ba50f05de00c4a6f07fed0a6e8bbd93817f39ded3980f7343")

source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-x86_64-gnome.zip")
sha256sums_x86_64=('d5c095e22edc9176ed18e1262dcb2ca8b2a9f33ea6d46e2bfde3ab43b49b6cd9')

source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/k0kubun/xremap/releases/download/v$pkgver/xremap-linux-aarch64-gnome.zip")
sha256sums_aarch64=('b7e2115e199f3266f6dd6aa7d38a0ad95506c2b615192fb8470b8b2fa2697a4f')

package() {
	cd "$srcdir/"
	./xremap --completions zsh > zsh_completions
	./xremap --completions fish > fish_completions
	./xremap --completions bash > bash_completions
	install -Dm644 zsh_completions "${pkgdir}/usr/share/zsh/site-functions/_xremap"
	install -Dm644 fish_completions "${pkgdir}/usr/share/fish/vendor_completions.d/xremap.fish"
	install -Dm644 bash_completions "${pkgdir}/usr/share/bash-completion/completions/xremap"
	install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/xremap-gnome-bin/LICENSE"
}
