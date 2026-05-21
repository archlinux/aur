# Maintainer: HeadedBranch <isaac.hesslegrave at gmail dot com>

pkgname=python-asciify-them
name=${pkgname#python-}
pkgver=1.1.1
pkgrel=2
pkgdesc="Allows you to turn images into ASCII art drawings"
arch=(any)
license=("MIT")
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz")
url="https://github.com/ndrscalia/asciify-them"
sha256sums=('8be6b25d7979e647c95c4d74d49518710486920f25f66f8c65cceae83a3f4e24')
makedepends=(python-build python-installer python-wheel)
depends=(python-opencv python-setuptools)
_filename=asciify_them

build() {
  cd $_filename-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_filename-$pkgver
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
