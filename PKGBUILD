# Maintainer: krumelmonster <krumelmonster@zoho.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgname=python-pyserial-labgrid-git
_pkgname=pyserial
pkgver=v3.5.0.2.r0.g1453982
pkgrel=1
pkgdesc="Multiplatform Serial Port Module for Python (labgrid-fork)"
arch=('any')
url="https://github.com/labgrid-project/pyserial"
license=('custom:PYTHON')
depends=('python')
provides=('python-pyserial')
conflicts=('python-pyserial')
makedepends=('python-setuptools')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd pyserial

  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/pyserial

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -vDm0644 -t "$pkgdir/usr/share/licenses/$pkgname" \
    LICENSE.txt
}
