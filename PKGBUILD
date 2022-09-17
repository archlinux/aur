# Maintainer: Xerz <xerz@xerz.one>
pkgname=moss-container-git
pkgver=r140.143364c
pkgrel=2
pkgdesc="Serpent OS build tool dependency"
arch=('x86_64')
url="https://github.com/serpent-os/moss-container"
license=('ZLIB')
depends=('moss-serpent')
makedepends=('git' 'ldc' 'meson' 'ninja')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/serpent-os/moss-container"
        "git+https://github.com/serpent-os/moss-core")
md5sums=('SKIP'
         'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	meson --prefix=/usr --buildtype=plain build
	meson compile -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	DESTDIR="$pkgdir" meson install -C build
	install -D -m644 "${srcdir}/${pkgname%-git}/LICENSES/Zlib.txt" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
