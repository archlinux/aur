# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Felix Yan <felixonmars@archlinux.org>

# Based on python-cookies in [community]

_name=cookies
pkgname=python2-$_name
pkgver=2.2.1
_commit=ab8185e06f221eaf65305f15e05852393723ac95
pkgrel=2
pkgdesc='Friendlier RFC 6265-compliant cookie parser/renderer'
arch=('any')
license=('MIT')
url="https://github.com/sashahart/$_name"
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner')
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha512sums=('38f9a4c96179256719f21b96356381066479f1ccadbe6f346f84d5b8d6023a0d6d5bb96f566a1b2d20de7ea5122c582b37f39aa71efbf667f14a607e0d869eb3')

prepare() {
  mv $_name-{$_commit,$pkgver}
}

build() {
  cd $_name-$pkgver

  python2 setup.py build
}

check() {
  cd $_name-$pkgver

  python2 setup.py pytest
}

package() {
  cd $_name-$pkgver

  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
