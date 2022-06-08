# Maintainer: Arvid Norlander <VorpalBlade (at) users DOT noreply DOT github DOT com>
pkgname=fluxvis
pkgver=1.0.0a4
pkgrel=1
epoch=
pkgdesc="Produce flux visualization from any flux files recognized by greaseweazle"
arch=('any')
url="https://github.com/adafruit/fluxvis"
license=('MIT')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-click' 'python-scikit-image')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b999b7f25c52fb133612290fa978b40ce2a58becd4b50588d507d5c27f236c12')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	install -m644 -t"$pkgdir/usr/share/licenses/$pkgname/" LICENSES/*
}
