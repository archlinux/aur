# Maintainer: Radu Potop <radu@wooptoo.com>
# Contributor: Arnaud Renevier <arno@renevier.net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: David Runge <dvzrv@archlinux.org>

pkgname=seqdiag
pkgver=3.1.0
pkgrel=2
pkgdesc="Generate sequence-diagram images from .diag files"
url="https://github.com/arenevier/seqdiag"
license=('Apache-2.0')
arch=('any')
depends=('python' 'blockdiag')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-docutils' 'python-pytest' 'python-pycodestyle' 'python-reportlab')
optdepends=('python-reportlab: for PDF export'
            'python-docutils: for RST parser')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('68a65dd47eb87032eb7f2a0b927669762565d5f8813a68eff2bc29cc1e844492203879ea4cbb4edcde9325094b7261e8a416df906068214e0d87d126d69124a5')

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
