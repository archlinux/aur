# Maintainer: Alejandro Fernandez Huguet <https://github.com/RinsedSloth>
pkgname=qmk
pkgver=0.0.15
pkgrel=2
pkgdesc="CLI tool for customizing supported mechanical keyboards."
arch=('any')
url="https://qmk.fm/"
license=('MIT')
depends=(
	'python-appdirs'
	'python-argcomplete'
	'python-colorama'
	'python-hjson'
	'dfu-programmer'
	'avrdude'
	'dfu-util'
	'avr-gcc'
	'avr-libc'
	'arm-none-eabi-gcc'
	)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/q/qmk/qmk-${pkgver}.tar.gz")
md5sums=("96a8b50debdf13c8929f904c911a6be6")
build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}
package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
