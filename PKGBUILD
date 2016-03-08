# Maintainer: Antony Lee <anntzer dot lee at gmail dot com>

_pyname=versioneer
pkgname=python-$_pyname
pkgver=0.15
pkgrel=1
pkgdesc='Easy VCS-based management of project version strings'
url="https://pypi.python.org/pypi/$_pyname/"
depends=('python-setuptools')
license=('custom')
arch=('any')
source=("https://pypi.python.org/packages/source/${_pyname:0:1}/$_pyname/$_pyname-$pkgver.tar.gz")
md5sums=('38c8810defbc26721b7e4a419c040892')

build() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py build
  sed -n '/## License/,$p' README.md > LICENSE
}

package() {
  cd $srcdir/$_pyname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
