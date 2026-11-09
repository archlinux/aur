# Maintainer: Radu Potop <radu@wooptoo.com>
# Contributor: Arnaud Renevier <arno@renevier.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=blockdiag
pkgver=3.4.3
pkgrel=1
pkgdesc="Generate block-diagram images from text files"
url="https://github.com/yuzutech/blockdiag"
license=('Apache-2.0')
arch=('any')
depends=('python' 'python-funcparserlib' 'python-pillow' 'python-webcolors')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-docutils' 'python-pytest' 'python-reportlab')
optdepends=('python-reportlab: for PDF export'
            'python-docutils: for RST parser')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6738a82e27afa5180215f29c677834dc1b944baa347ec989bdff5ccc3b5307cc')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  PYTHONDONTWRITEBYTECODE=1 pytest
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGES,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 "${pkgname}.1" -t "${pkgdir}/usr/share/man/man1/"
}
