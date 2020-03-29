# Maintainer: Akaash Suresh <https://github.com/Curry>
pkgname=qmk
pkgver=0.0.31
pkgrel=1
pkgdesc="CLI tool for customizing supported mechanical keyboards."
arch=('any')
url="https://github.com/qmk/qmk_cli"
license=('MIT')
depends=(
    'arm-none-eabi-binutils'
    'arm-none-eabi-gcc'
    'arm-none-eabi-newlib'
    'avrdude'
    'avr-binutils'
    'avr-libc'
    'python-appdirs'
	'python-argcomplete'
	'python-colorama'
    'flake8'
    'avr-gcc'
    'clang'
    'dfu-programmer'
    'dfu-util'
    'diffutils'
    'gcc'
    'git'
    'libusb-compat'
    'unzip'
    'wget'
    'zip'
	)
makedepends=('python-setuptools' 'python' 'python-pip')
source=("https://files.pythonhosted.org/packages/source/q/qmk/qmk-${pkgver}.tar.gz")
sha256sums=('843c89914ac9749880913c2f54739c7c7ff15b45cfa988008385615f85403deb')

build() {
    pip install --no-deps --target="deps" yapf hjson
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py build
}

package() {
    sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
	cd "${srcdir}/${pkgname}-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    cp -r $srcdir/deps/* $pkgdir/"$sitepackages"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
