# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-soupsieve
pkgver=2.3.2.post1
pkgrel=1
pkgdesc="A CSS4 selector implementation for Beautiful Soup"
url="https://github.com/facelessuser/soupsieve"
license=('MIT')
arch=('any')
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-hatchling')
checkdepends=('python38-pytest' 'python38-beautifulsoup4' 'python38-html5lib' 'python38-lxml')
source=("https://github.com/facelessuser/soupsieve/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('80eae1e7256cbcf2f2b8520779a5bdb68798e9813ed738ee933204ff1c23ad52553e21f3aa89ad61b900b906dcaa7a1eebd819300417304df782cda9e2d79c4a')

build() {
  cd soupsieve-$pkgver
  python3.8 -m build --wheel --no-isolation
}

check() {
  cd soupsieve-$pkgver
  # https://gitlab.gnome.org/GNOME/libxml2/-/issues/312
  pytest \
    --deselect tests/test_extra/test_soup_contains.py::TestSoupContains::test_contains_cdata_html \
    --deselect tests/test_extra/test_soup_contains_own.py::TestSoupContainsOwn::test_contains_own_cdata_html
}

package() {
  cd soupsieve-$pkgver
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
