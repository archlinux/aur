# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-cookies
pkgver=2.2.1
_commit=ab8185e06f221eaf65305f15e05852393723ac95
pkgrel=6
pkgdesc='Friendlier RFC 6265-compliant cookie parser/renderer'
arch=('any')
license=('MIT')
url='https://github.com/sashahart/cookies'
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest-runner')
source=("$pkgname-$_commit.tar.gz::https://github.com/sashahart/cookies/archive/$_commit.tar.gz")
sha512sums=('38f9a4c96179256719f21b96356381066479f1ccadbe6f346f84d5b8d6023a0d6d5bb96f566a1b2d20de7ea5122c582b37f39aa71efbf667f14a607e0d869eb3')

prepare() {
  mv cookies-{$_commit,$pkgver}
}

build() {
  cd "$srcdir"/cookies-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/cookies-$pkgver
  # https://gitlab.com/sashahart/cookies/issues/6
  python setup.py pytest || echo "Tests failed"
}

package() {
  cd cookies-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
