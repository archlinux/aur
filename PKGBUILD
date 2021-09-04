# Maintainer: Serene-Arc
pkgname=qmk-git
pkgver=1.0.0.r0.g710dc3e
pkgrel=1
pkgdesc="CLI tool for customizing supported mechanical keyboards."
arch=('any')
url="https://github.com/qmk/qmk_cli"
license=('MIT')
_branch=qmk_cli
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
makedepends=('python' 'python-pip')
source=('git+https://github.com/qmk/qmk_cli.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_branch"
  echo $(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
}

build() {
    cd "$_branch"
	python -m build --wheel
}

package() {
	cd "$_branch/dist"
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
	python -O -m compileall "${pkgdir}/qmk-git"
}
