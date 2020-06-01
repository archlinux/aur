# Maintainer: project-repo <archlinux-aur@project-repo.co>
pkgname=cagebreak
pkgver=1.3.0
pkgrel=1
pkgdesc='Tiling wayland compositor based on cage inspired by ratpoison'
arch=('x86_64')
url='https://github.com/project-repo/cagebreak'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'wl-clipboard' 'wlroots' 'pango')
makedepends=('meson' 'ninja' 'pandoc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/project-repo/cagebreak/releases/download/$pkgver/release_$pkgver.tar.gz")
sha512sums=('9d93ac58e898334ac35273b15760f2c111def5c0eca1f30a14f668dd9c093f186cb409d8faa70899d58ae05568f9a2597be234fefaa0bc0c70896f24584d4e85')
build() {
	cd "$pkgname"
	meson build --buildtype=release -Dxwayland=true
	ninja -C build
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
