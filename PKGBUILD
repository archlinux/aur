# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-daltonlens
_name=${pkgname#python-}
pkgver=0.1.5
pkgrel=1
pkgdesc="R&D companion package for the desktop application DaltonLens"
arch=('any')
url="https://github.com/DaltonLens/DaltonLens-Python"
license=('MIT')
depends=('python-numpy' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-setuptools-git' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4fb7d7951745b5c570e565113ea6610a6ba5522d599c27c25e070bb531de35ab')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
