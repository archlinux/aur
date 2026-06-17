# Maintainer: Radu Potop <radu@wooptoo.com>
# Contributor: Arnaud Renevier <arno@renevier.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=blockdiag
pkgver=3.4.2
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
sha256sums=('55e91305ca0238a7d3505dfaa23eab6f434c3dca0bdfa02da763d8fc6306d990')

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
