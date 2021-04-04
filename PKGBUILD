# Maintainer: Groctel <aur@taxorubio.com>
pkgname=python-glcontext
_name=glcontext
pkgver=2.3.3
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
source=("$url/releases/download/$pkgver/$_name-$pkgver.tar.gz")
sha512sums=('80b2292034d5a8e4e132091c186046ebbceaf322a80226eab11c7121a0d4f51416f3ca30b8b0e7792dbaae1fe47e4b0810482cd73e6fa020b43841d187d71edd')

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
