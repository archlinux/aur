# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>
# Source: https://github.com/zancarius/archlinux-pkgbuilds

pkgname=python-billiard
pkgver=3.6.3.0
pkgrel=1
pkgdesc="Python multiprocessing fork with improvements and bugfixes."
arch=('x86_64')
url="https://pypi.org/project/billiard/"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner' 'python-case' 'python-psutil')
source=("https://pypi.io/packages/source/b/billiard/billiard-$pkgver.tar.gz")
sha512sums=('8fde933c7f605aa4958a6f9da7aa876f42ef7250845b113fc175f8e8af1760063ac6b2a7a222d2c0bac4715f18986a2ee1a5528cc14925b2060dca8a5bd2333c')

prepare() {
  sed -i 's/< *5/<6/' billiard-$pkgver/requirements/test.txt
}

build() {
  cd "$srcdir"/billiard-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/billiard-$pkgver
  python setup.py pytest
}

package() {
  cd "$srcdir"/billiard-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm0664 "$srcdir"/billiard-$pkgver/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
