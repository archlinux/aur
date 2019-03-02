# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-raccoon
pkgver=2.1.5
pkgrel=2
pkgdesc="Python DataFrame with fast insert and appends"
url="https://github.com/rsheftel/raccoon"
arch=('any')
license=('MIT')
depends=('python-blist' 'python-six' 'python-tabulate')
makedepends=('python-pip')
source=(
  "https://files.pythonhosted.org/packages/py2.py3/r/raccoon/raccoon-$pkgver-py2.py3-none-any.whl"
  "https://raw.githubusercontent.com/rsheftel/raccoon/master/LICENSE"
)
sha256sums=(
  'fd2388d715d8b07ed5b00aeeb8b670405b21b273e0ee967bf02507df583ae998'
  'a96e75fc0f88ed8bad941facf1548a78e3fe68bf374fe2dbf0baaa535c758a5c'
)

package() {
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps raccoon-$pkgver-py2.py3-none-any.whl
    rm -r "$pkgdir/usr/lib/python3.7/site-packages/tests"
    python -O -m compileall "$pkgdir/usr/lib/python3.7/site-packages/raccoon"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
