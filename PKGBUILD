# Maintainer: Cyan903 <cyanp0515 at gmail dot com>

pkgname="quatracker-git"
pkgver=r77.cae8ba6
pkgrel=2
pkgdesc="A score tracker for the rhythm game Quaver."
arch=("x86_64")
url="https://github.com/Cyan903/Quatracker"
license=("MIT")
depends=("webkit2gtk")
makedepends=("git" "jq" "go" "nodejs" "pnpm")
provides=("quatracker")
conflicts=("quatracker")
source=("git+$url.git")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/Quatracker"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/Quatracker"
	make build-linux
}

package() {
	cd "$srcdir/Quatracker"

	install -Dm755 "./build/bin/$(jq --raw-output '.outputfilename' wails.json)" "$pkgdir/usr/bin/quatracker"
	install -Dm644 "./README.md" "$pkgdir/usr/share/doc/$pkgname/README"
	install -Dm644 "./LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	install -Dm644 "./package/assets/quatracker.desktop" "$pkgdir/usr/share/applications/quatracker.desktop"
	install -Dm644 "./package/assets/quatracker.png" "$pkgdir/usr/share/pixmaps/quatracker.png"
}
