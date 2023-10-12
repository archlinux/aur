# Maintainer: Alexander Bocken <alexander@bocken.org>
pkgname=bibel-git
pkgver=r53.a55eb0c
pkgrel=1
pkgdesc="Read the the German Catholic Einheitsübersetzung, with annotations, from your terminal"
arch=(any)
depends=(bash)
makedepends=('git')
url="https://github.com/AlexBocken/bibel"
license=('custom:Public Domain')
source=('bibel::git+https://github.com/AlexBocken/bibel.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 bibel $pkgdir/usr/bin/bibel
	install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname}/LICENSE
}
