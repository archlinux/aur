# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname=waybackpy-git
pkgver=3.0.0.r0.gde5a3e1
pkgrel=1
pkgdesc='CLI tool that interfaces with the Internet Archives Wayback Machine API'
arch=('any')
url='https://github.com/akamhy/waybackpy'
license=('MIT')
depends=('python-requests' 'python-click')
makedepends=('git' 'python-setuptools')
provides=('python-waybackpy' "${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  git -C "$pkgname" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  python setup.py build
}

package() {
  export PYTHONHASHSEED=0
  cd "$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

# vim: ts=2 sw=2 et:
