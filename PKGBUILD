# Maintainer: Groctel <aur@taxorubio.com>
pkgname=python-glcontext
_name=glcontext
pkgver=2.3.4
pkgrel=1
pkgdesc="A library providing OpenGL implementation for ModernGL on multiple platforms."
arch=('any')
url="https://github.com/moderngl/glcontext"
license=('MIT')
depends=(
	'python'
)
makedepends=(
	'python-setuptools'
)
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('9ab412a03e82b82d86ee8939074c311ef777d6fed718601860cf4dc08e57e0bff553d9731948f2df784e611cbba1d829b9887d76c0a306950c51e1f86df60340')

build() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}
