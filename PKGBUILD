# Maintainer:	Batuhan Baserdem <lastname dot firstname at gmail>

_name='qmk_cli'
pkgname='python-qmk'
provides=('qmk')
conflicts=('qmk')
pkgver=0.0.35
pkgrel=2
pkgdesc='A program to help users work with QMK'
arch=('any')
url="https://github.com/qmk/${_name}"
license=('MIT')
source=("${url}/archive/${pkgver}.tar.gz"
  '50-atmel-dfu.rules'
  '54-input-club-keyboard.rules'
  '55-caterina.rules'
  '56-dfu-util.rules'
  '57-bootloadhid.rules'
  'python-qmk.install')
md5sums=('60e198326815bad6af8971e69b95709a'
         'ce0817b57cc65e1b40e1d0015050a9f9'
         '89d4e608e03def55193afde3e6d27b2c'
         '3a5ed80897da7caf331908ed21cdfcfb'
         'cdd374ddb63b5570817063a3272aeb6d'
         'bd8d991a807e12acc88f87b0ac749cb2'
         'da712505652b669000a1c8408c93da81')
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
  install=python-qmk.install
  cd "${srcdir}/${_name}-${pkgver}"
  # Run python setup function
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  # Install the licence
  install -Dm644 "${srcdir}/${_name}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Install udev rules for different bootloaders
  install -Dm644 "${srcdir}/50-atmel-dfu.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/50-atmel-dfu.rules"
  install -Dm644 "${srcdir}/54-input-club-keyboard.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/54-input-club-keyboard.rules"
  install -Dm644 "${srcdir}/55-caterina.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/55-caterina.rules"
  install -Dm644 "${srcdir}/56-dfu-util.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/56-dfu-util.rules"
  install -Dm644 "${srcdir}/57-bootloadhid.rules" \
    "${pkgdir}/usr/lib/udev/rules.d/57-bootloadhid.rules"
}
