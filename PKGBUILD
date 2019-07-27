# Maintainer: Ethan Brittain-Morby <ebm539 at protonmail dot com>
pkgname=python-metaname-git
pkgver=r14.ce20e21
pkgrel=2
pkgdesc="A python JSON-RPC client for the Metaname API"
arch=('any')
url="https://github.com/metaname/python-metaname"
license=('MIT')
depends=(python python-requests)
makedepends=(git)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=("git+https://github.com/metaname/python-metaname")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  python setup.py build
}

package() {
  cd "${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname%-git}/README"
}

