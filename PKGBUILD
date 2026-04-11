# Maintainer: Qingxu <me@linioi.com>
# Maintainer: k0kubun <takashikkbn@gmail.com>
pkgname=xremap-niri-bin
pkgdesc='Dynamic key remapper for X11 and Wayland (Niri Wayland Version)'
pkgver=0.15.1
pkgrel=1

provides=('xremap')
license=('MIT')
url='https://github.com/xremap/xremap'
arch=('x86_64' 'aarch64')
options=('!debug')

source=("LICENSE-$pkgver::https://raw.githubusercontent.com/xremap/xremap/v$pkgver/LICENSE")
sha256sums=('60365594c733128ba50f05de00c4a6f07fed0a6e8bbd93817f39ded3980f7343')

source_x86_64=("$pkgname-$pkgver-x86_64.zip::https://github.com/xremap/xremap/releases/download/v$pkgver/xremap-linux-x86_64-niri.zip")
sha256sums_x86_64=('bf63e41fbd77d6da93b2cc2e6389f5fc7458e19dae0e3d0a4d31ebbb730fcc36')

source_aarch64=("$pkgname-$pkgver-aarch64.zip::https://github.com/xremap/xremap/releases/download/v$pkgver/xremap-linux-aarch64-niri.zip")
sha256sums_aarch64=('11f44f8416489207bc5efeb1c0d917109a00de05045adb2bfeeff846c4c081b1')

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