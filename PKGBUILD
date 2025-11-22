# Maintainer: detiam <dehe_tian at outlook dot com>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>

_name=keyboard
pkgname=python-$_name
pkgver=0.13.5
pkgrel=3
pkgdesc="Hook and simulate $_name events on Windows and Linux"
arch=('any')
license=('MIT')
url="https://github.com/boppreh/$_name"
depends=('python3')
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("https://github.com/boppreh/$_name/archive/v$pkgver.tar.gz")
sha512sums=('cea0945671a83a0be411801c6bf90c94eb37036dd232e9cf46700aff49f3e23800b93292bcf1b108c558c9c3179dd01d73796b21916e0bed7e5a2407f9c8f094')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/"$_name"-$pkgver.dist-info/licenses/LICENSE.txt \
    "$pkgdir"/usr/share/licenses/$pkgname

  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}

