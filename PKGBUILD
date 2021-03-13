# Maintainer: João Figueiredo <jf.mundox@gmail.com>

pkgname=pyspace-git
pkgver=r55.7fca0da
pkgrel=1
pkgdesc='GLSL Fractal Ray Marcher in Python'
arch=(any)
url='https://github.com/HackerPoet/PySpace'
license=(MIT)
depends=(python-{opengl,pygame,numpy})
makedepends=(git)
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd PySpace
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd PySpace
	install -Dm755 ray_marcher_demo.py -t "$pkgdir/opt/PySpace/"
	install -Dm644 pyspace/* -t "$pkgdir/opt/PySpace/pyspace"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

	install -d "$pkgdir/usr/bin/"
	ln -s /opt/PySpace/ray_marcher_demo.py "$pkgdir/usr/bin/pyspace"
	chmod +x "$pkgdir/usr/bin/pyspace"
}
