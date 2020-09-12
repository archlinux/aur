# Maintainer: project-repo <archlinux-aur@project-repo.co>
pkgname=cagebreak
pkgver=1.4.1
pkgrel=1
pkgdesc='Tiling wayland compositor based on cage inspired by ratpoison'
arch=('x86_64')
url='https://github.com/project-repo/cagebreak'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'wlroots' 'pango')
makedepends=('meson' 'ninja' 'pandoc')
optdepends=('wl-clipboard: clipboard support'
            'xorg-server-xwayland: x application support')
options=('!buildflags' '!strip')
conflicts=('cagebreak-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/project-repo/cagebreak/releases/download/$pkgver/release_$pkgver.tar.gz")
sha512sums=('c81dbf03f7421bd5fff597b197e1ae6344257e7e34f948a5f9931381853be8d1606fcc9230b686d849e5b1b07d8e1615e598256908d7750ffa048f05609e665e')
build() {
	cd "$pkgname"
	meson build --buildtype=release -Dxwayland=true
	ninja -C build
}
check() {
	cd "$pkgname"
	gpg --verify signatures/cagebreak.sig build/cagebreak
}
package() {
	cd "$pkgname"
	mkdir -p "$pkgdir/usr/bin/"
	cp 'build/cagebreak' "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	mkdir -p "$pkgdir/usr/share/man/man1/"
	mkdir -p "$pkgdir/usr/share/man/man5/"
	cp 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"
	cp 'build/cagebreak.1' "$pkgdir/usr/share/man/man1/"
	cp 'build/cagebreak-config.5' "$pkgdir/usr/share/man/man5/"
}
