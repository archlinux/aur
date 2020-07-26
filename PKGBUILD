# Maintainer:	Batuhan Baserdem <lastname dot firstname at gmail>

_name='qmk_cli'
pkgname='qmk-cli'
provides=('qmk')
conflicts=('qmk')
pkgver=0.0.35
pkgrel=1
pkgdesc='A program to help users work with QMK'
arch=('any')
url="https://github.com/qmk/${_name}"
license=('MIT')
source=("${url}/archive/${pkgver}.tar.gz")
md5sums=('60e198326815bad6af8971e69b95709a')
makedepends=('python-setuptools')
depends=(
  'arm-none-eabi-binutils'
  'arm-none-eabi-gcc'
  'arm-none-eabi-newlib'
  'avr-binutils'
  'avr-gcc'
  'avr-libc'
  'avrdude'
  'clang'
  'dfu-programmer'
  'dfu-util'
  'diffutils'
  'gcc'
  'git'
  'libffi'
  'libusb-compat'
  'unzip'
  'wget'
  'zip'
  'python'
  'python-appdirs'
  'python-argcomplete'
  'python-colorama'
  'python-hjson'
  'flake8'
  'python-nose2'
  'yapf'
)

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  # Run python setup function
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  # Install the licence
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
