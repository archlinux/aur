#Maintainer: German Lashevich <german.lashevich@gmail.com>

pkgname=docoseco
pkgver=1.0.0
pkgrel=1
pkgdesc="Automatize management of docker confgs and secrets"
arch=(any)
license=(MIT)
url="https://github.com/Zebradil/docoseco"
depends=(python3 python-ruamel-yaml)
makedepends=(python-setuptools python-dephell)
provides=(docoseco)
source=(
  https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz
)
sha512sums=('30c7652873e296237bc0eda6226a581f7ad618f473790cb843de041afd324c37255ed88acd97783c5f1533dd4ca7c3974f0f3d87c42c2849426fe15ed5803199')

prepare() {
  cd "$pkgname-$pkgver"
  dephell deps convert --from pyproject.toml --to setup.py
  python3 setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}


# vim: set ts=2 sw=2 et:
