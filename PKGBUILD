# Maintainer: Simon Legner <Simon.Legner@gmail.com>

pkgname=git-revise-git
pkgdesc='Efficiently update, split, and rearrange commits'
pkgver=0.6.0.r29.g06e9126
pkgrel=1
arch=('any')
url=https://mystor.github.io/git-revise.html
license=('MIT')
source=("git+https://github.com/mystor/${pkgname%-git}.git")
depends=('git' 'python')
makedepends=('python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
b2sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname%-git}
  python setup.py build
}

package() {
  cd ${pkgname%-git}
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
