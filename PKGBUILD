# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Pochang Chen <johnchen902@gmail.com>

pkgname=python-nclib
_name=nclib
pkgver=0.8.3
pkgrel=2
pkgdesc="Netcat as a library: convienent socket interfaces"
license=('MIT')
arch=('any')
url="https://pypi.python.org/pypi/nclib"
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/rhelmot/nclib/release/stable/LICENSE")
sha512sums=('5080e8ce4742b522342926a35709b1e437630137d73eaecca6d9a630277265e0a71ebe0c9011a6b73f3bd39b029a2e38825fe2d448780763cfd68e429227bfd2'
            'bfc2f2a28a84f096d914cfeefa0c1da6080dffc62e787f0558b0f05e23ddcedc448fbd72177be65e5a543441e1612aae3e1004e693bf081092cddce01b208787')

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

check() {
  cd "$_name-$pkgver"
  python setup.py test
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE"
}
