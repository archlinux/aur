# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=python-ffmpeg-python
_name=${pkgname#python-}
pkgver=0.2.0
pkgrel=1
pkgdesc='Python bindings for FFmpeg - with complex filtering support'
arch=('any')
url='https://pypi.org/project/ffmpeg-python'
license=('Apache2')
depends=('python' 'python-future')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/kkroening/ffmpeg-python/master/LICENSE")
md5sums=('1aa943ce1b4e720eec77d3ec9a225724'
         'SKIP')

build() {
	cd "$srcdir/${_name}-$pkgver"
	python setup.py clean --all
	python setup.py build
}

package() {
	cd "$srcdir/${_name}-$pkgver"
	python setup.py install --root "$pkgdir" --skip-build --optimize=1
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
