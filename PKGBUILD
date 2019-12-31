# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=organize
_name="$pkgname-tool"
pkgver=1.7.0
pkgrel=1
pkgdesc='A command line utility to automate file organization tasks'
arch=('any')
url='https://github.com/tfeldmann/organize'
license=('MIT')
depends=('python'
         'python-appdirs'
         'python-colorama'
         'python-docopt'
         'python-exifread'
         'python-pyaml'
         'python-send2trash')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "use-setuptools.patch")
sha1sums=('e81e69acaf54e814e1ced66b51277a6fe4e96660'
          '93298c0b724d26b4bcd8776fab8f507a21a8814a')
sha256sums=('036ebfd00770d2ef3240dc80945be99707a7f8bd05bff362c1c785c5fc80de97'
            '2064be42394f5455db87e5cb975d9963538a8e46b2fbcc8e2bc70e4442037386')

prepare() {
  cd "$_name-$pkgver"
  patch -p0 -i "$srcdir/use-setuptools.patch"
}

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 noet:
