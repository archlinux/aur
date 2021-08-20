# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=fp-build-git
pkgver=r5.c0560be
pkgrel=1
pkgdesc='Script to make flatpak packaging easier'
arch=(any)
url=https://github.com/lionirdeadman/fp-build
license=(LGPL2.1)
depends=(flatpak-builder python gzip)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url.git")
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 "${pkgname%-git}.sh" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}
