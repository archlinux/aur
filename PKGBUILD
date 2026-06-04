# Maintainer: Stitchless
# Maintainer: k0kubun <takashikkbn@gmail.com>
pkgname=xremap-kde-bin
pkgdesc='Dynamic key remapper for X11 and Wayland (KDE Wayland Version)'
pkgver=0.15.8
pkgrel=1

provides=('xremap')
license=('MIT')
url='https://github.com/xremap/xremap'
arch=('x86_64' 'aarch64')
options=('!debug')

source=("LICENSE-$pkgver::https://raw.githubusercontent.com/xremap/xremap/v$pkgver/LICENSE")
sha256sums=('60365594c733128ba50f05de00c4a6f07fed0a6e8bbd93817f39ded3980f7343')
sha256sums_x86_64=('cb68521995a72e4567e4bb6e5afe9f2366df722ec75d94aa4be808d18d8f6dd1')
sha256sums_aarch64=('dcdc38fe3f015e7103ef3038231a7e213a07667f051c6d2bfaa5d31ba9fdfcd7')

source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/xremap/xremap/releases/download/v$pkgver/xremap-linux-x86_64-kde.zip")

source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/xremap/xremap/releases/download/v$pkgver/xremap-linux-aarch64-kde.zip")

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
