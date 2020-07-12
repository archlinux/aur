# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=mpv-webm-git
pkgver=r84.9b5da33
pkgrel=1
pkgdesc='Simple WebM maker for mpv'
arch=(any)
url='https://github.com/ekisu/mpv-webm'
license=(MIT)
depends=(mpv)
makedepends=(git moonscript)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git)
md5sums=(SKIP)

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-git}"
	make
}

package() {
	install -Dm644 "${pkgname%-git}/build/webm.lua" -t "$pkgdir/usr/lib/mpv"
	install -Dm644 "${pkgname%-git}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
