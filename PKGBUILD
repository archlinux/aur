# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname="python-desert"
_pkgname="${pkgname#python-}"
pkgver=2020.1.6
pkgrel=3
pkgdesc='Deserialize to objects while staying DRY'
arch=('any')
url='https://github.com/python-desert/desert'
license=('MIT')
depends=('python' 'python-marshmallow' 'python-attrs' 'python-typing_inspect')
# NOTE: python-dataclasses was introduced in Python 3.7, so no longer an explicit dependency.
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('8975c4358fb23a4f638d353c74578f386c113c6d0d317f6c66122197d4295aecc03c72c814cca68504d87e64f08064b9905f12816972300b962f7558015acc73')

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
