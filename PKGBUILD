# Maintainer: Kira Sokolova <Kyra256@proton.me>

pkgname=python-term-image
pkgver=0.7.2
pkgrel=2
pkgdesc="Display images in the terminal with python"
arch=(any)
url="https://github.com/AnonymouX47/term-image"
license=('MIT')
_name=${pkgname#python-}
depends=(python-requests python-pillow python-typing_extensions)
optdepends=(python-urwid)
makedepends=(python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
sha256sums=('07320573baa667dcde145d55e94769cbaafeea43b61245245153ff5075b55ffb')

build() {
  cd ${_name//-/_}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
