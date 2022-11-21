# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname='python38-et-xmlfile'
pkgver=1.1
pkgrel=3
pkgdesc="A low memory library for creating large XML files."
arch=('any')
url="https://et-xmlfile.readthedocs.io/"
license=('MIT')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest-runner' 'python38-lxml')
source=("https://foss.heptapod.net/openpyxl/et_xmlfile/-/archive/${pkgver}/et_xmlfile-${pkgver}.tar.gz")
sha256sums=('8d6705c2f97b2d6195c95e5f3781a1ed44a59d43cf1263e04034767e5db65131')

prepare() {
  cd "$srcdir"/et_xmlfile-${pkgver}
  # fix deprecation warning
  sed -i "s/strict/strict-markers/" pytest.ini
}

build() {
  cd "$srcdir"/et_xmlfile-${pkgver}
  python3.8 setup.py build
}

check() {
  cd "$srcdir"/et_xmlfile-${pkgver}
  python3.8 setup.py pytest
}

package() {
  cd "$srcdir"/et_xmlfile-${pkgver}
  python3.8 setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENCE.rst "$pkgdir"/usr/share/licenses/$pkgname/LICENCE
}
