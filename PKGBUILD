# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>

_name=PyMCTranslate
pkgname=python-${_name,,}
pkgver=1.0.11
pkgrel=1
pkgdesc='A library of block mappings that can be used to convert from any Minecraft format into any other Minecraft format'
arch=('any')
url="https://github.com/gentlegiantJGC/$_name"
license=('custom')
depends=('python' 'python-amulet-nbt' 'python-numpy')
makedepends=('python-pip' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ed89b3fed8ab5486295416402732ae60878858339dd007d55394d1e0a77d2a8e')

build() {
  cd "$_name-$pkgver"

  # only bdist_wheel minifies and installs json
  python setup.py bdist_wheel
}

package() {
  cd "$_name-$pkgver"

  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "dist/$_name-$(python -c 'import versioneer; print(versioneer.get_version())')-py3-none-any.whl"
  python -O -m compileall "$pkgdir"/usr/lib/python*/site-packages/$_name
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
