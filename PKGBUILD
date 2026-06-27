# Maintainer: Stitchless
# Maintainer: k0kubun <takashikkbn@gmail.com>
pkgname=xremap-kde-bin
pkgdesc='Dynamic key remapper for X11 and Wayland (KDE Wayland Version)'
pkgver=0.15.9
pkgrel=1

provides=('xremap')
license=('MIT')
url='https://github.com/xremap/xremap'
arch=('x86_64' 'aarch64')
options=('!debug')

source=("LICENSE-$pkgver::https://raw.githubusercontent.com/xremap/xremap/v$pkgver/LICENSE")
sha256sums=('60365594c733128ba50f05de00c4a6f07fed0a6e8bbd93817f39ded3980f7343')

source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/xremap/xremap/releases/download/v$pkgver/xremap-linux-x86_64-kde.zip")
sha256sums_x86_64=('572b70fc09fa45bec207cfb2374084a35250ed315957ac0c6d6ebe6e1851e9ca')

source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/xremap/xremap/releases/download/v$pkgver/xremap-linux-aarch64-kde.zip")
sha256sums_aarch64=('663e9bd79eabc9add4a392f4d83cb7a97fa48eff7f6d7f2f6e8599ee1bf77d1b')

package() {
	cd "$srcdir/"
	./xremap --completions zsh > zsh_completions
	./xremap --completions fish > fish_completions
	./xremap --completions bash > bash_completions
	install -Dm644 zsh_completions "${pkgdir}/usr/share/zsh/site-functions/_xremap"
	install -Dm644 fish_completions "${pkgdir}/usr/share/fish/vendor_completions.d/xremap.fish"
	install -Dm644 bash_completions "${pkgdir}/usr/share/bash-completion/completions/xremap"
	install -Dm755 xremap "${pkgdir}/usr/bin/xremap"
	install -Dm644 "LICENSE-$pkgver" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}