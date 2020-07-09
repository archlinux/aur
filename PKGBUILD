# Maintainer: Akaash Suresh <https://github.com/Curry>
pkgname=qmk
pkgver=0.0.35
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
  'python-nose2'
  'flake8'
  'avr-gcc'
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
  'yapf'
  'zip'
)
makedepends=('python-setuptools' 'python' 'python-pip')
source=("https://files.pythonhosted.org/packages/source/q/qmk/qmk-${pkgver}.tar.gz")
sha256sums=('e704ca31cdca264bfdd99c72a4849a9e9762043e4bf328118c49af92d1c0a3b5')

build() {
  pip install --no-deps --target="deps" hjson
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
