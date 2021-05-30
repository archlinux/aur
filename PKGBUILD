# Maintainer: Corey Powell (mistdragon100@gmail.com)
# This package requires rust in order to build, but since arch users may have rustup
# installed instead, the makedepends has been omitted for now
pkgname=helix-bin
pkgver=0.0.4
pkgrel=1
pkgdesc="A text editor written in rust"
url="https://helix-editor.com"
arch=(x86_64)
makedepends=()
depends=()
source=("https://github.com/helix-editor/helix/releases/download/v${pkgver}/helix-v${pkgver}-${arch}-linux.tar.xz")
sha256sums=('48148ad3759fda229e08853923e6dcc1f7bd213856bea6ffaf0a9179df3abddd')

prepare() {
	cat > "hx" << EOF
#!/usr/bin/env sh
HELIX_RUNTIME=/usr/lib/helix/runtime exec /usr/lib/helix/hx "\$@"
EOF
	chmod +x "hx"
}

package() {
	name=$srcdir/helix-v${pkgver}-${arch}-linux

	mkdir -p "$pkgdir/usr/lib/helix/"
	cp -r "$name/runtime" "$pkgdir/usr/lib/helix/"
	install -Dm 0777 "$name/hx" "$pkgdir/usr/lib/helix/hx"
	install -Dm 0444 "$name/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 0777 "$srcdir/hx" "$pkgdir/usr/bin/hx"
}
