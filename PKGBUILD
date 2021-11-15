# Maintainer: Daniele Basso <daniele05 dot bass at gmail dot com>
# Contributor: Andrea Feletto <andrea@andreafeletto.com>

pkgname=river-bin
_pkgname=river
pkgver=0.1.0
pkgrel=2
pkgdesc='A dynamic tiling wayland compositor.'
arch=('x86_64')
url='https://github.com/riverwm/river'
license=('GPL3')
depends=(
	'mesa' 'wlroots' 'wayland' 'wayland-protocols' 'libxkbcommon'
	'libevdev' 'pixman' 'xorg-xwayland' 'polkit'
)
provides=('river' 'riverctl' 'rivertile')
conflicts=('river-bin' 'river-git' 'river-noxwayland-git')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver.tar.gz")
sha256sums=('003fb95fcdc78d0993199057f8eaa83284d83b32890b29489496ddd71c209798')

package() {
	cd "$srcdir/$_pkgname-$pkgver"

	# binaries
	install -d "$pkgdir/usr"
	cp -R zig-out/bin "$pkgdir/usr"

	# completions
	install -Dm644 completions/bash/riverctl \
		-t "$pkgdir/usr/share/bash-completion/completions"
	install -Dm644 completions/fish/riverctl.fish \
		-t "$pkgdir/usr/share/fish/vendor_completions.d"
	install -Dm644 completions/zsh/_riverctl \
		-t "$pkgdir/usr/share/zsh/site-functions"

	# wayland protocols
	install -Dm644 protocol/river-layout-v3.xml \
		-t "$pkgdir/usr/share/river-protocols"

	# docs
	install -Dm644 doc/river.1 \
		-t "$pkgdir/usr/share/man/man1"
	install -Dm644 doc/riverctl.1 \
		-t "$pkgdir/usr/share/man/man1"
	install -Dm644 doc/rivertile.1 \
		-t "$pkgdir/usr/share/man/man1"
	install -Dm644 LICENSE \
		-t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md \
		-t "$pkgdir/usr/share/doc/$_pkgname"
}
