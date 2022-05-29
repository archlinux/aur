# Maintainer: nblock <nblock [/at\] archlinux DOT us>

pkgname=organize
_name="$pkgname-tool"
pkgver=2.2.0
pkgrel=1
pkgdesc='A command line utility to automate file organization tasks'
arch=('any')
url='https://github.com/tfeldmann/organize'
license=('MIT')
depends=('python'
         'python-click'
         'python-exifread'
         'python-fs'
         'python-jinja'
         'python-pyaml'
         'python-rich'
         'python-schema'
         'python-send2trash'
         'python-simplematch')
optdepends=('python-textract: extract text from any document')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        remove-version-constraints.patch)
sha1sums=('c5fdbf9eb15a4a16ee4e5c0d499628c6e2441c67'
          '4433641203cf595f54b17044c1e661b6e7431a8a')
sha256sums=('f912ce6d71baaf163f8961da9dcc283dd0ad38a6186f6f6590c4efadcdf34cac'
            '4b42a7d257da4e2598b6de14740cfaea8ec6240eacc692bcae78f4bbf89a813b')

prepare() {
  cd "$_name-$pkgver"
  # Remove all upper-bound version constraints created by poetry.
  patch -p1 -i "$srcdir/remove-version-constraints.patch"
}

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python setup.py install --skip-build --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 noet:
