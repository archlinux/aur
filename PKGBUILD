# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>

pkgname=python-user_agent
_name=user_agent
pkgver=0.1.10
pkgrel=1
pkgdesc='Generate random, valid web user-agent headers'
arch=('any')
url='https://github.com/lorien/user_agent'
license=('MIT')
depends=('python-six')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/u/$_name/$_name-$pkgver.tar.gz")
sha256sums=('b86537cb2a9d3bda0e2afcc654ec15b383502836877a67520654acadf73f1723')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
  install -Dm644 'README.rst' -t "${pkgdir}/usr/share/doc/${pkgname}"

  local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s \
    "$_site/$_name-$pkgver.dist-info/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
