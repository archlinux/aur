# Maintainer: Groctel <aur@taxorubio.com>
pkgname=python-manimpango
_name=ManimPango
pkgver=0.2.5.post0
pkgrel=1
pkgdesc="C binding for Pango using Cython used in Manim to render (non-LaTeX) text."
arch=('any')
url="https://manimpango.manim.community"
license=('GPL3')
depends=(
	'pango'
	'python'
)
makedepends=(
	'python-setuptools'
	'cython'
)
provides=()
source=("https://github.com/ManimCommunity/$_name/releases/download/v$pkgver/$_name-$pkgver.tar.gz")
sha512sums=('10c0ffc0f5bdb4ba3a3e7d12153a3416c7331c3aa5b7c413a2230bf1c4cb1ca5f6a26d6e7e3b47a28062ebdbc0695ff4b619931c6034a35ce360ba3561a8189a')

build() {
	cd "$srcdir/$_name-$pkgver"
	rm -f ManimPango/*.c
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}

