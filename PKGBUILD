# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname="python-desert"
_pkgname="${pkgname#python-}"
pkgver=2020.11.18
pkgrel=2
pkgdesc='Deserialize to objects while staying DRY'
arch=('any')
url='https://github.com/python-desert/desert'
license=('MIT')
depends=('python' 'python-marshmallow' 'python-attrs' 'python-typing_inspect')
# NOTE: python-dataclasses was introduced in Python 3.7, so no longer an explicit dependency.
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('5cf52104bf18531a0caf737109655a0090d75aca681cafd97160d90e9d29326fd02bb19985130e53a494853b95b51da4efbc8ce64b4e6711c4b13c6d3e10e73f')

build() {
  cd "$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # fix file permissions
  find "$pkgdir" -type f -exec chmod 0644 {} \;

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
