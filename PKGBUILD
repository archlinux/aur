# Maintainer: Hans Gaiser <hansg91@email.com>

pkgname=moonshine-git
pkgver=r128.35225f9
pkgrel=1
pkgdesc="Server for streaming the desktop using the NVIDIA GameStream / Moonlight protocol."
arch=('x86_64')
url="https://github.com/hgaiser/moonshine"
license=('custom')

source=(
	"${pkgname%-git}::git+https://github.com/hgaiser/moonshine"
	"moonshine.service"
)
sha256sums=('SKIP'
            'b49624ca9e42748e09764d9a03b5baafe3ff078f22c238023ebe7ad1cb1265d1')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 target/release/${pkgname%-git} "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm755 "$srcdir/moonshine.service" "$pkgdir/usr/lib/systemd/user/moonshine.service"
}
