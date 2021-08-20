# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=fp-stats-git
pkgver=r48.42bae6c
pkgrel=1
pkgdesc='Scripts for making statistics around Flathub'
arch=(any)
url=https://github.com/lionirdeadman/fp-stats
license=(LGPL2.1)
depends=(python)
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
	for scriptname in $(ls | grep "^flathub.*\.py$"); do
		install -Dm755 "$scriptname" "$pkgdir/usr/bin/${scriptname%\.py}"
	done
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/${pkgname%-git}"
}
