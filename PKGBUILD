# Maintainer: Arnaud Renevier <arno@renevier.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=blockdiag
pkgver=3.3.0
pkgrel=1
pkgdesc="generates block-diagram image from text"
url="http://blockdiag.com"
license=('Apache-2.0')
arch=('any')
depends=('python3' 'python-funcparserlib' 'python-pillow' 'python-webcolors')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-docutils' 'python-reportlab')
optdepends=('python-reportlab: for PDF export'
            'python-docutils: for RST parser')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yuzutech/blockdiag/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('b871ed7b5d6aa9e4c682d68aadf2d9b8386f7541d739c420e75b5c22f22948982d687ceee8f4852a08bff5bea3916fc6d670b0c387bc6396151a31f118e39027')

build() {
  cd blockdiag-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd blockdiag-$pkgver
  PYTHONDONTWRITEBYTECODE=1 pytest
}

package() {
  cd blockdiag-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 "${pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"
}
