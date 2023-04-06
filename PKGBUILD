# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>

pkgname=python-testing.common.database
pkgver=2.0.3
pkgrel=9
pkgdesc='Utilities for testing.* packages'
arch=(any)
url='https://github.com/tk0miya/testing.common.database'
license=(Apache)
makedepends=(python-setuptools)
depends=(python)
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/tk0miya/testing.common.database/archive/$pkgver.tar.gz"
        python310.patch)
sha256sums=('f2d4f865e52bacf54cf853b6043cceb06a31ed020b50d3b0e63c7e59c66f00b4'
            '826867930199ad4032b668fdd8113f0390856c7c947ae25c44c232be9f4801da')

prepare() {
  cd testing.common.database-$pkgver
  patch -Np1 -i ../python310.patch

  # https://github.com/tk0miya/testing.common.database/issues/21
  sed -i 's|2\.0\.2|2.0.3|' setup.py
}

build() {
  cd testing.common.database-$pkgver
  python setup.py build
}

package() {
  cd testing.common.database-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
