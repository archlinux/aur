# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>

pkgname=python38-xlsxwriter
pkgver=3.0.3
pkgrel=1
pkgdesc="A Python module for creating Excel XLSX files"
arch=('any')
url="https://github.com/jmcnamara/XlsxWriter"
license=('BSD')
depends=('python38')
makedepends=('python38-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/RELEASE_${pkgver}.tar.gz")
sha512sums=('92a53226aa9ee9f8493fe7171ce752f3a13ef8f3107aecbef896f17022e93bd7dbccb5e619fcbbb3598102030b190d75508d4dacce20b9643eead59a4441f6aa')
b2sums=('f4dfa6b286dda94a1a44d8168b8e17f7a37f2f59a23aa3a5ed0efa46b5d8bdcdb831e99a61924e22755c6a921c23f5c540c048152cd07363841ff09a49549c79')

build() {
  cd "$srcdir"/XlsxWriter-RELEASE_${pkgver}
  python3.8 setup.py build
}

check() {
  cd "$srcdir"/XlsxWriter-RELEASE_${pkgver}
  python3.8 -m unittest discover
}

package() {
  cd "$srcdir"/XlsxWriter-RELEASE_${pkgver}
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -D -m644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
