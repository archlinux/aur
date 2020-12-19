# Maintainer: leuko <leuko_aydos_de>
_py=xacro4sdf
pkgname=python-$_py-git
provides=(python-$_py)
pkgver=r39.ab6a2c8
pkgrel=1
pkgdesc="a simple XML macro script for sdf, like ros/xacro which is desiged for urdf."
arch=(any)
url="https://github.com/gezp/xacro4sdf"
license=(MIT)
depends=(python)
makedepends=(python-setuptools git)
source=("git+$url")
md5sums=(SKIP)
pkgver() {
	cd $_py
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd $_py
	python setup.py build
}
package() {
	cd $_py
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
